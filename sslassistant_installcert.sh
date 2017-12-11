#!/bin/bash
# ex30a.sh: "Colorized version of ex30.sh

Escape="\033";

BlackF="${Escape}[30m"; RedF="${Escape}[31m"; GreenF="${Escape}[32m";
YellowF="${Escape}[33m"; BlueF="${Escape}[34m"; Purplef="${Escape}[35m";
CyanF="${Escape}[36m"; WhiteF="${Escape}[37m";

BlackB="${Escape}[40m"; RedB="${Escape}[41m"; GreenB="${Escape}[42m";
YellowB="${Escape}[43m"; BlueB="${Escape}[44m"; PurpleB="${Escape}[45m";
CyanB="${Escape}[46m"; WhiteB="${Escape}[47m";

BoldOn="${Escape}[1m"; BoldOff="${Escape}[22m";
ItalicsOn="${Escape}[3m"; ItalicsOff="${Escape}[23m";
UnderlineOn="${Escape}[4m"; UnderlineOff="${Escape}[24m";
BlinkOn="${Escape}[5m"; BlinkOff="${Escape}[25m";
InvertOn="${Escape}[7m"; InvertOff="${Escape}[27m";

Reset="${Escape}[0m";

backupDateTime="%m%d%Y%H%M%S"
timestamp=`date +"$backupDateTime"`

#Change terminal to display UTF-8
LANG=en_US.UTF-8

#=========================================HEADER END=======================================================
#=========================================BRAND START=====================================================
brand="GeoTrust"
#=========================================BRAND END=======================================================



#Create SSL directory if it does not exist
symantecDir="${HOME}/${brand}/ssl"
mkdir -p ${symantecDir} >/dev/null 2>&1
if [ "$?" = 1 ]
then
    echo "Unable to create the directory '$HOME/${brand}/ssl'"
	exit 1
fi

logFile=${symantecDir}/sslassistant_${timestamp}.log
log()
{
	time=`date +"%t %x %k:%M:%S%t"`
        logentry="INFO "$time$1
	echo -e $logentry >> $logFile
}

logError()
{

	time=`date +"%t %x %k:%M:%S%t"`
	logerror="ERROR"$time$1
	echo -e $logerror >>$logFile
}
# Check to see if openssl is available
checkOpenSSLInstalled()
{
	command -v openssl &>/dev/null || { echo "Cannot locate openssl." >&2; exit 1; }
	if [ "$(id -u)" != "0" ]; then
	   echo "Please run the SSL Assitant Tool as root" 1>&2
           exit 1
         fi
}

# Check to see if curl is available
checkCurlInstalled()
{
     command -v curl &>/dev/null || { echo "Cannot locate curl.To auto download and install certificate please install curl." >&2; exit 1; }
}

# Check apache version greater than 2.2
checkApacheVersionGreaterThan_2_2()
{
   version="2.2.0"

    IFS=$'.'
    arr1=($fullVersion)
    arr2=($version)
    unset IFS

    for ((i=0;i<${#arr1[@]};++i)); do

	   if (( ${arr1[i]} == ${arr2[i]} )); then
     		apacheVersionGreaterThan_2_2="equal"
     		continue
       elif (( ${arr1[i]} < ${arr2[i]} )); then
            apacheVersionGreaterThan_2_2="false"
            break
       elif (( ${arr1[i]} > ${arr2[i]} )); then
            apacheVersionGreaterThan_2_2="true"
            break
           fi
    done
}



# Check apache version smaller than 2.4.8
checkApacheVersionGreaterThan_2_4_8()
{
    version="2.4.8"

    IFS=$'.'
    arr1=($fullVersion)
    arr2=($version)
    unset IFS

    for ((i=0;i<${#arr1[@]};++i)); do

          if (( ${arr1[i]} == ${arr2[i]} )); then
             apacheVersionGreaterThan_2_4_8="equal"
             continue
          elif (( ${arr1[i]} < ${arr2[i]} )); then
             apacheVersionGreaterThan_2_4_8="false"
             break
          elif (( ${arr1[i]} > ${arr2[i]} )); then
             apacheVersionGreaterThan_2_4_8="true"
             break
          fi
     done
}

jsonValue()
{
  KEY=$1
  num=$2
  awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}



requiredPrompt()
{
	echo -e -n "$1"
	read result;
        log "Value entered for $1 $result"

	while [ -z "$result" ]; do
		echo "The value entered is invalid. Re-enter the information."
		logError "Invalid value entered for $1 $result"
                echo -e -n "$1"
		read result;
		log "Value entered for $1 $result"
    done
}

requiredFilePrompt()
{
	read -e -p "$1" result
        log "Filename entered for $1 $result"

	while [ -z "$result" ]; do
		echo "The value entered is invalid. Re-enter the information."
		logError "Invalid filename entered for $1 $result"
                read -e -p "$1" result
		log "Filename entered for $1 $result"
	done
}

requiredTwoCharPrompt()
{
	echo -e -n "$1"
	read result;
        log "Value entered for $1 $result"

	while [ "${#result}" -ne "2" ]; do
		echo "The value entered is invalid. Re-enter the information."
		logError "Invalid value entered for $1 $result"
                echo -e -n "$1"
		read result;
		log "Value entered for $1 $result"
    done
}

requiredSecretPrompt()
{
	echo -e -n "$1"
	read -s result;
	log "Value entered for Password '******'"
	echo

	while [ -z "$result" ]; do
		echo "The value entered is invalid. Re-enter the information."
		logError "Invalid value entered for Password"
                echo -e -n "$1"
		read -s result;
		echo
		log "Value entered for Password '******'"
    done
}

#Check that HTTPD version 2 is installed and mod_ssl.so is available.
checkHttpd()
{
	log  "Checking to see if httpd is available..."
        # Check to see if httpd is available
	command -v httpd &>/dev/null || { echo "Cannot locate Apache 2.0 in system path." >&2; log "Cannot locate Apache in system path."; exit 1; }

	apache=`httpd -v | grep Apache/`
	fullVersion=${apache#*/}
	fullVersion=${fullVersion% *}
	version=${fullVersion%%.*}
	
	log "Checking if httpd -v command returns valid version..."
	if [ -z "$version" ]
	then
	       echo ""httpd -v" command did not return a valid version.Please ensure you have Apache version 2.0 and above installed"
		
	else
		log  "Checking to see if httpd is version 2..."
        	if [ $version != "2" ]
		then
			echo "Apache 2.0 not found. "'('"Found version $fullVersion"')'""
			logError "Apache 2.0 not found. Found version $fullVersion"
			exit 1
		fi
	fi

	log  "Checking to see if mod_ssl is available..."
        if [ ! -e "/etc/httpd/modules/mod_ssl.so" ]
	then
		echo "Unable to find /etc/httpd/modules/mod_ssl.so. Make sure that the mod_ssl"
		echo "module is installed on this server."
		logError "Unable to find /etc/httpd/modules/mod_ssl.so. Make sure that the mod_ssl module is installed on this server."
		log "module is installed on this server."
		exit 1;
	fi
}

showEula()
{
	echo -e -n "${BoldOn}Do you accept the End User Software Licence Agreement in the eula.txt file? (y/n):${BoldOff} "
	log "Presenting End User Software Licence Agreement..."
        while [ "$accept" != "y" ]; do
		read -s -n1 accept
                log "End User Software Licence Agreement accepted."
		if [ "$accept" = "n" ]
		then
			echo n
			log "End User Software Licence Agreement declined."
			exit 0
		fi
	done
	echo y
}
getCipher(){
echo
        echo "The RSA encryption algorithm is typical for most cases, while the DSA encryption algorithm"
        echo " is a requirement for some U.S. government agencies. Only use DSA if you are sure that you need it."
        echo -e -n "${BoldOn}Please specify the cipher algorithm. ${BoldOff}\n"
	if [[ "$brand" == "Symantec" ]]
	then
		echo -e -n "${BoldOn}Choose between ${CyanF} RSA ${Reset} ${BoldOn}or ${CyanF} DSA ${Reset} ${BoldOn}or ${CyanF} ECC ${Reset}:"
	else
		echo -e -n "${BoldOn}Choose between ${CyanF} RSA ${Reset} ${BoldOn}or ${CyanF} DSA ${Reset}"
	fi

	read algo
	algo=$(echo $algo | tr '[:lower:]' '[:upper:]')
        
		if [ -z "${algo##[R][S][A]}" ]
                 then
                      cipher="RSA"
                      
                elif [ -z "${algo##[D][S][A]}" ]
                then
                      cipher="DSA"
                elif [ -z "${algo##[E][C][C]}" ] && [[ "$brand" == "Symantec" ]]
	        then
		    cipher="ECC"
  
		else
                   cipher="RSA"
                    echo
                    echo -e -n "\tInvalid selection. Defaulting to RSA"
                    echo
	fi
}
checkAlgorithmEntered(){

	count=$((count+1))
	if  echo "${AlgoOptions[@]}" | fgrep --word-regexp "$UserInput">/dev/null 2>&1; 
	then
          
	     cipher="$UserInput"
	     result=1
	    
	elif [ $count -lt 2 ]
	then
	     echo "Type the name of your preferred encryption algorithm from following value/s: "
	     for (( i=${cipherOptions}-1; i>=0; i-- ));
	     do
	              echo -e -n "${BoldOn}.${AlgoOptions[i]}${BoldOff}\n"
	     done
	     echo -n "Enter the encryption algorithm:"
    	     read UserInput
	     UserInput=$(echo $UserInput | tr '[:lower:]' '[:upper:]')
	else
   	    cipher=$defaultalgo
	    
     fi
} 

setCipher(){
	declare -i count=0
	declare -i result=0
	declare -i cipherOptions=0
	
	cipher=$(echo ${cipher} | tr '[:lower:]' '[:upper:]')
	IFS="," read -ra AlgoOptions<<<"$cipher"               
	defaultalgo="${AlgoOptions[0]}"
	cipherOptions=${#AlgoOptions[@]}

	if [ $cipherOptions -eq 1 ]
	then
	  checkAlgorithmEntered

	   if [ $result -eq 1 ]
	   then
		log "setting cipher value to $cipher" 
	   else
         	checkAlgorithmEntered
	   fi
 	else
	echo "Type the name of your preferred encryption algorithm from following value/s: "

	for (( i=${cipherOptions}-1; i>=0; i-- ));
	  do
			    
		echo -e -n "${BoldOn}.${AlgoOptions[i]}${BoldOff}\n"
	  done
		echo -n "Enter the encryption algorithm:"		
		read UserInput
		UserInput=$(echo $UserInput | tr '[:lower:]' '[:upper:]')
		checkAlgorithmEntered

		if [ $result -eq 1 ]
		then
			log "setting cipher value to $cipher" 
		else
        	 	checkAlgorithmEntered
		fi
	fi
}



#=========================================CERTIFICATE START==================================================

getCertificate()
{
 log "Reading in the Certificate..."
 certificate="-----BEGIN CERTIFICATE-----
MIIErTCCA5WgAwIBAgIQDAzI19ffTHpAzdHFjhSw6TANBgkqhkiG9w0BAQsFADBe
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMR0wGwYDVQQDExRSYXBpZFNTTCBSU0EgQ0EgMjAxODAe
Fw0xNzExMjcwMDAwMDBaFw0xOTExMjcxMjAwMDBaMBkxFzAVBgNVBAMTDnd3dy53
aG9ydWIuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr3mI6gOi
QUDxQ7e4RAztGbx8Gm3cMxDnzLXq83d+K5QvltAmcYYU34AwZyFdbgpOCPumnETm
lMwuRoYYNBWoWHOWMjFM95PM/IB4hlMDQVjJxsE2f1LnoPy8z+RF+apk8tPao1kA
b9YdljaT4IZPgN+dISf9BoE+a/fZBCcrZBeP2ZmlLBbZRGLRckcugwkq8Pj7GAxo
VGeybD4pECLE+bOu0UGrBmLzOWvwoaGQvD0qVCsM8TO4D6KNiGJkyiHSkkqM/6Jm
guT/b+9rmPRYNKLSkj9vrcptioVSOb3q+mUP3HzG72VmOswAHJA2iDH/nGHe6roy
KBPxCBsSwGIFNwIDAQABo4IBqjCCAaYwHwYDVR0jBBgwFoAUU8oXWfxrwAMhLxqu
5KqoHIJW2nUwHQYDVR0OBBYEFNmHDOW/299+hecol5GDmYoIrgv0MCUGA1UdEQQe
MByCDnd3dy53aG9ydWIuY29tggp3aG9ydWIuY29tMA4GA1UdDwEB/wQEAwIFoDAd
BgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIwPgYDVR0fBDcwNTAzoDGgL4Yt
aHR0cDovL2NkcC5yYXBpZHNzbC5jb20vUmFwaWRTU0xSU0FDQTIwMTguY3JsMEwG
A1UdIARFMEMwNwYJYIZIAYb9bAECMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3
LmRpZ2ljZXJ0LmNvbS9DUFMwCAYGZ4EMAQIBMHUGCCsGAQUFBwEBBGkwZzAmBggr
BgEFBQcwAYYaaHR0cDovL3N0YXR1cy5yYXBpZHNzbC5jb20wPQYIKwYBBQUHMAKG
MWh0dHA6Ly9jYWNlcnRzLnJhcGlkc3NsLmNvbS9SYXBpZFNTTFJTQUNBMjAxOC5j
cnQwCQYDVR0TBAIwADANBgkqhkiG9w0BAQsFAAOCAQEAPvrqDuTq++BhYyF8jkDv
I240AyzQvIa3qvWg+Adt9bRW0lP466b4U5ZcbPP47gMfkZE7KeXaElV69nbcmmhv
dAVkfTm+llfhJNTgP4RoKKMTUS+HefP0738xgk0Udo2oyOZpkZes+1Usg2UGewRw
wGVnzoZ5cwbQHSoiHEaOynNr17hy2CUCvdrtDLz4M0xeKLyloi7GHA8/haf44wxi
r/ceLHCm28D1d3jG3/cGefh33jka82gp0ND3rm72dlH062qfNQQKl/0EDxj2xPSo
uz/1+BpjLsm2YHimSMBASQVEARI3D78ZDTx4F/pE7Gqi8HZEWn0zphrYPfTne8Mo
4A==
-----END CERTIFICATE-----
"
}

getIntermediateCerts()
{
 log "Reading in Intermediate Certificate..."
 issuerChain="-----BEGIN CERTIFICATE-----
MIIEsTCCA5mgAwIBAgIQCKWiRs1LXIyD1wK0u6tTSTANBgkqhkiG9w0BAQsFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD
QTAeFw0xNzExMDYxMjIzMzNaFw0yNzExMDYxMjIzMzNaMF4xCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
b20xHTAbBgNVBAMTFFJhcGlkU1NMIFJTQSBDQSAyMDE4MIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEA5S2oihEo9nnpezoziDtx4WWLLCll/e0t1EYemE5n
+MgP5viaHLy+VpHP+ndX5D18INIuuAV8wFq26KF5U0WNIZiQp6mLtIWjUeWDPA28
OeyhTlj9TLk2beytbtFU6ypbpWUltmvY5V8ngspC7nFRNCjpfnDED2kRyJzO8yoK
MFz4J4JE8N7NA1uJwUEFMUvHLs0scLoPZkKcewIRm1RV2AxmFQxJkdf7YN9Pckki
f2Xgm3b48BZn0zf0qXsSeGu84ua9gwzjzI7tbTBjayTpT+/XpWuBVv6fvarI6bik
KB859OSGQuw73XXgeuFwEPHTIRoUtkzu3/EQ+LtwznkkdQIDAQABo4IBZjCCAWIw
HQYDVR0OBBYEFFPKF1n8a8ADIS8aruSqqByCVtp1MB8GA1UdIwQYMBaAFAPeUDVW
0Uy7ZvCj4hsbw5eyPdFVMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEF
BQcDAQYIKwYBBQUHAwIwEgYDVR0TAQH/BAgwBgEB/wIBADA0BggrBgEFBQcBAQQo
MCYwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBCBgNVHR8E
OzA5MDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRHbG9i
YWxSb290Q0EuY3JsMGMGA1UdIARcMFowNwYJYIZIAYb9bAECMCowKAYIKwYBBQUH
AgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwCwYJYIZIAYb9bAEBMAgG
BmeBDAECATAIBgZngQwBAgIwDQYJKoZIhvcNAQELBQADggEBAH4jx/LKNW5ZklFc
YWs8Ejbm0nyzKeZC2KOVYR7P8gevKyslWm4Xo4BSzKr235FsJ4aFt6yAiv1eY0tZ
/ZN18bOGSGStoEc/JE4ocIzr8P5Mg11kRYHbmgYnr1Rxeki5mSeb39DGxTpJD4kG
hs5lXNoo4conUiiJwKaqH7vh2baryd8pMISag83JUqyVGc2tWPpO0329/CWq2kry
qv66OSMjwulUz0dXf4OHQasR7CNfIr+4KScc6ABlQ5RDF86PGeE6kdwSQkFiB/cQ
ysNyq0jEDQTkfa2pjmuWtMCNbBnhFXBYejfubIhaUbEv2FOQB3dCav+FPg5eEveX
TVyMnGo=
-----END CERTIFICATE-----
"
 echo "${issuerChain}" > "${certChainFile}"
}

getCert()
{
  if [[ "$cipher" =~ "$defaultCipher" || -z "$cipher" ]]
  then
      getCipher
  fi

  sslDir="/etc/httpd/conf/ssl"
  if [ ! -d $sslDir ]
  then
      mkdir -p $sslDir;
  fi

  cert="${symantecDir}/${commonName}_${cipher}_certificate.crt"

  if [ -e "${cert}" ]
  then
      log echo "(Certificate installation already attempted with given commonname and algorith"
      mv ${cert} ${cert}.`date +"${backupDateTime}"`.bak
  fi

  getCertificate
  echo "${certificate}" > $cert
  echo
}

#=========================================CERTIFICATE END====================================================




installCert()
{
        getCertAndPrivateKey()
	{
              publicKey1=`openssl x509 -pubkey -noout -in $cert 2> /dev/null`
              cipher=$(echo ${cipher} | tr '[:upper:]' '[:lower:]')


		#test that publicKey1 returned is non empty
                if [ ! -n "$publicKey1" ]
		then
			echo "Public key is not found in specified certificate."
			log "Public key is not found in specified certificate."
			exit 1
		fi

		#Get the issuer name from the certificate
		issuer=`openssl x509 -in $cert -issuer -noout`
		issuer=${issuer#*CN=}
		issuer=${issuer%%/*}

		requiredFilePrompt "Enter the path for the private key that matches the certificate: "
		privateKey=$result
		echo
		if [ ! -f $privateKey ]
		then
			echo "The private key file does not exist."
			log "The private key file does not exist."
			exit 1
		fi

		requiredSecretPrompt "Enter the passphrase for the private key: "
		passphrase=$result
		echo

		
		if [[ "$cipher" == "ecc" ]]
	    then
		  publicKey2=`openssl ec -pubout -in $privateKey -passin pass:$passphrase 2> /dev/null`
		else
		  publicKey2=`openssl $cipher -pubout -in $privateKey -passin pass:$passphrase 2> /dev/null`
		fi

		if [ "$publicKey1" != "$publicKey2" ]
		then
			echo "The certificate does not contain the public key for the given private key"
			echo "or the passphrase is incorrect."
			log "The certificate does not contain the public key for the given private key"
			log "or the passphrase is incorrect."
			exit 1
		fi

		#Get the common name from privatekey as it can from the cert we cannot extract utf8 characters
		commonName=${privateKey##*/}
		commonName=${commonName%_*}
	}

	findSslConf()
	{
		sslFile="/etc/httpd/conf.d/ssl.conf"
                log "Reading into $sslFile..."

		if [ ! -e "$sslFile" ]
		then
			log "Empty file: $sslFile"
                        unset sslFile
                        return 1
		fi

		tmp=`cat $sslFile | grep "Listen 443" | wc -l`
		if [ "$tmp" -ne "1" ]
		then
			log "Listen 443 exists more than once in the $sslFile"
                        unset sslFile
			return 1
		fi

		keyFileLine=`cat $sslFile | grep -n -P "^[ \t#]*SSLCertificateKeyFile"`
		keyFileLine=${keyFileLine%:*}
		tmp=`cat /etc/httpd/conf.d/ssl.conf | grep -P "^[ \t#]*SSLCertificateKeyFile " | wc -l`
		if [ "$tmp" -ne "1" ]
		then
			log "SSLCertificateKeyFile does not exist exactly once in the $sslFile"
                        unset sslFile
			return 1
		fi

		certChainFileLine=`cat $sslFile | grep -n -P "^[ \t#]*SSLCertificateChainFile"`
		certChainFileLine=${certChainFileLine%:*}
		tmp=`cat $sslFile | grep -P "^[ \t#]*SSLCertificateChainFile" | wc -l`
		if [ "$tmp" -ne "1" ]
		then
                  if [[ "$apacheVersionGreaterThan_2_4_8" == "true" ]]  || [[ "$apacheVersionGreaterThan_2_4_8" == "equal" ]]
                  then
			           log "SSLCertificateChainFile is deprecated from 2.4.8 version"
                  else
			            log "SSLCertificateChainFile does not exist exactly once in the $sslFile"
                        unset sslFile
			            return 1
                  fi

         else 
                  if [[ "$apacheVersionGreaterThan_2_4_8" == "true" ]]  || [[ "$apacheVersionGreaterThan_2_4_8" == "equal" ]]
                  then
		                 log "SSLCertificateChainFile exist but is derprecated from 2.4.8 version "
                         unset sslFile
			             return 1
                  fi
		fi


		certFileLine=`cat $sslFile | grep -n -P "^[ \t#]*SSLCertificateFile"`
		certFileLine=${certFileLine%:*}
		tmp=`cat $sslFile | grep -P "^[ \t#]*SSLCertificateFile " | wc -l`
		if [ "$tmp" -ne "1" ]
		then
		    log "SSLCertificateFile does not exist exactly once in the $sslFile"
            unset sslFile
			return 1
		fi
	}

	#Backs up any existing intermediate certs and copies the new one into apache folder
	installIntermediateCert()
	{
		certChainFile="/etc/httpd/conf/ssl/${commonName}_intermediate.cer"
                if [ -e "${certChainFile}" ]
		then
			echo "Backing up previous intermediate certificate chain"
			log "Backing up previous intermediate certificate chain"
			mv "${certChainFile}" "${certChainFile}.`date +"${backupDateTime}"`.bak"
		fi
		getIntermediateCerts
	}

	#Backs up any existing key and copies the new key into apache folder
	installPrivateKey()
	{
                privateKeyFile="/etc/httpd/conf/ssl/${commonName}_private.key"
		if [ -e "${privateKeyFile}" ]
		then
			echo "Backing up the previous private key."
			log "Backing up the previous private key."
			mv "${privateKeyFile}" "${privateKeyFile}.`date +"${backupDateTime}"`.bak"
		fi

		log "Copying in new key..."
                cp "${privateKey}" "${privateKeyFile}"
	}

	#Backs up any existing cert and copies the new cert into apache folder
	installCertInApache()
	{
		certFile="/etc/httpd/conf/ssl/${commonName}.cer"
		if [ -e "${certFile}" ]
		then
			log "Backing up the previous certificate."
                        echo "Backing up the previous certificate."
			mv "${certFile}" "${certFile}.`date +"${backupDateTime}"`.bak"
		fi

		log "Copying in new certificate..."

                if [[ "$apacheVersionGreaterThan_2_4_8" == "true" ]]  || [[ "$apacheVersionGreaterThan_2_4_8" == "equal" ]]
                then
                     log "Apache version from 2.4.8 onwards needs cert and intermediate in one file"
                     cp $cert $certFile
                     cat $certChainFile >> $certFile
                else
                     cp $cert $certFile
                fi
	}

	updateSslConf()
	{
		echo "Backing up the $sslFile"
		log "Backing up old $sslFile"
		cp $sslFile /etc/httpd/conf.d/ssl.conf.`date +"${backupDateTime}"`.bak

		log "Updating lines for SSLCertificateKeyFile, SSLCertificateFile and SSLCertificateChainFile"
        sslConf=`cat $sslFile`
		sslConf=`echo "${sslConf}" | sed "${keyFileLine} s#.*#SSLCertificateKeyFile ${privateKeyFile////\/}#"`

        if [[ "$apacheVersionGreaterThan_2_4_8" == "true" ]]  || [[ "$apacheVersionGreaterThan_2_4_8" == "equal" ]]
        then
              log "Updating ssl.conf - Apache version from 2.4.8 onwards needs cert and intermediate in one file"
		      sslConf=`echo "${sslConf}" | sed "${certFileLine} s#.*#SSLCertificateFile ${certFile////\/}#"`
        else
		      sslConf=`echo "${sslConf}" | sed "${certFileLine} s#.*#SSLCertificateFile ${certFile////\/}#"`
		      sslConf=`echo "${sslConf}" | sed "${certChainFileLine} s#.*#SSLCertificateChainFile ${certChainFile////\/}#"`

        fi
		echo "${sslConf}" > /etc/httpd/conf.d/ssl.conf
	}

	writeSslConf()
	{
		#If the ssl.conf doesn\'t exist, we will create it. If it does, we will create a new one but
		#in the users directory. The user will have to manually configure apache.
		newSslConfFile="/etc/httpd/conf.d/ssl.conf"
		if [ -e "$newSslConfFile" -o  ! -d "/etc/httpd/conf.d" ]
		then
			log "Apache configuration not recognized."
                        echo "Apache configuration not recognized. SSL configuration "
			echo "file will be created in the user\'s home directory. Apache "
			echo "will have to be manually configured and restarted."

			newSslConfFile="$HOME/${brand}/ssl/ssl.conf"
		fi

		echo "Writing Apache SSL configuration to $newSslConfFile"
                log "Writing Apache SSL configuration to $newSslConfFile"

		echo "#Apache2 SSL configuration file" > $newSslConfFile
		echo "" >> $newSslConfFile
		echo "LoadModule ssl_module modules/mod_ssl.so" >> $newSslConfFile
		echo "Listen $port" >> $newSslConfFile
		echo "SSLPassPhraseDialog  builtin" >> $newSslConfFile
		echo "SSLSessionCache shmcb:/var/cache/mod_ssl/scache"'('"512000"')'"" >> $newSslConfFile
		echo "SSLSessionCacheTimeout  300" >> $newSslConfFile

        if [[ "$apacheVersionGreaterThan_2_2" == "false" ]]
        then
		    echo "SSLMutex default" >> $newSslConfFile
        fi

		echo "SSLRandomSeed startup file:/dev/urandom  256" >> $newSslConfFile
		echo "SSLRandomSeed connect builtin" >> $newSslConfFile
		echo "SSLCryptoDevice builtin" >> $newSslConfFile
		echo "<VirtualHost _default_:$port>" >> $newSslConfFile
		echo "  ErrorLog logs/ssl_error_log" >> $newSslConfFile
		echo "  TransferLog logs/ssl_access_log" >> $newSslConfFile
		echo "  CustomLog logs/ssl_request_log \"%t %h \\\"%r\\\" %b\"" >> $newSslConfFile
		echo "  LogLevel warn" >> $newSslConfFile
		echo "  SSLEngine on" >> $newSslConfFile
		echo "  SSLProtocol -ALL +TLSv1 +TLSv1.1 +TLSv1.2" >> $newSslConfFile
		echo "  SSLHonorCipherOrder  on" >> $newSslConfFile
		echo "  SSLCipherSuite EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH:EDH+aRSA:!aNULL:!eNULL:!LOW:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS:!RC4" >> $newSslConfFile
		echo "  <IfModule mod_headers.c>" >> $newSslConfFile
        echo "        Header add Strict-Transport-Security \"max-age=15768000\" ">> $newSslConfFile
        echo "  </IfModule>" >> $newSslConfFile
		
        if [[ "$apacheVersionGreaterThan_2_4_8" == "true" ]]  || [[ "$apacheVersionGreaterThan_2_4_8" == "equal" ]]
        then
            log "Writing in new ssl.conf - Apache version from 2.4.8 onwards need cert and intermediate in one file "
		    echo "  SSLCertificateFile ${certFile}" >> $newSslConfFile
        else 
		    echo "  SSLCertificateFile ${certFile}" >> $newSslConfFile
		    echo "  SSLCertificateChainFile ${certChainFile}" >> $newSslConfFile

        fi

		echo "  SSLCertificateKeyFile ${privateKeyFile}" >> $newSslConfFile
		echo "  <Files ~ \"\\."'('"cgi|shtml|phtml|php3?"')'"$\">" >> $newSslConfFile
		echo "    SSLOptions +StdEnvVars" >> $newSslConfFile
		echo "  </Files>" >> $newSslConfFile
		echo "  <Directory "/var/www/cgi-bin">" >> $newSslConfFile
		echo "    SSLOptions +StdEnvVars" >> $newSslConfFile
		echo "  </Directory>" >> $newSslConfFile
		echo "  SetEnvIf User-Agent ".*MSIE.*" nokeepalive ssl-unclean-shutdown downgrade-1.0 force-response-1.0" >> $newSslConfFile
		echo "</VirtualHost>" >> $newSslConfFile
	}

	port=443

	checkHttpd
	getCertAndPrivateKey
    checkApacheVersionGreaterThan_2_2
    checkApacheVersionGreaterThan_2_4_8

	mkdir -p /etc/httpd/conf/ssl >/dev/null 2>&1
	if [ "$?" = 1 ]
	then
		echo "Unable to create the directory '/etc/httpd/conf/ssl'"
		log "Unable to create the directory /etc/httpd/conf/ssl"
		exit 1
	fi

	installIntermediateCert
	installPrivateKey
	installCertInApache

	findSslConf

        #SSL configuration not found for specified host
	if [ -z "${sslFile}" ]
	then
		log "SSL configuration not found for specified host, writing SSL Config."
                writeSslConf
	else
		log "SSL configuration found for specified host, updating SSL Config"
                updateSslConf
	fi

	echo
	echo "You must restart the Apache Web server to finish the certificate installation. When you "
	echo "restart Apache, you need the passphrase that you created during CSR generation."
	echo
}


clear

log "${brand} Certificate Installation Assistant Log `date`"
checkOpenSSLInstalled
showEula

echo
	if [[ "$brand" == "Symantec" ]]
	then
		echo -e "${BoldOn}${UnderlineOn}Welcome to the ${brand} Certificate Assistant Version 5.0.${UnderlineOff}${BoldOff}"
	else 
		echo -e "${BoldOn}${UnderlineOn}Welcome to the ${brand} Certificate Assistant Version 4.0.${UnderlineOff}${BoldOff}"
	fi
echo
echo
echo "Log file for this session created at $logFile"
echo

commonName="WWW.WHORUB.COM"
cipher="RSA"
defaultCipher="__CIPHER__"

getCert

subject=`openssl x509 -in $cert -subject -noout`

city=${subject#*L=}
city=${city%%/*}
state=${subject#*ST=}
state=${state%%/*}
country=${subject#*C=}
country=${country%%/*}

commonName=${subject#*CN=}
commonName=${commonName%%/*}
org=${subject#*O=}
org=${org%%/*}
orgunit=${subject#*OU=}
orgunit=${orgunit%%/*}

if [[ "$commonName" =~ "subject=" ]]
then
	commonName=""
fi

if [[ "$org" =~ "subject=" ]]
then
	org=""
fi

if [[ "$orgunit" =~ "subject=" || "$orgunit" =~ "verisign" || "$orgunit" =~ "www.verisign.com" ]]
then
    orgunit=""
fi

if [[ "$city" =~ "subject=" ]]
then
	city=""
fi

if [[ "$state" =~ "subject=" ]]
then
	state=""
fi

if [[ "$country" =~ "subject=" ]]
then
	country=""
fi


echo -e "${BoldOn}This tool will install the certificate with the given Distinguished Name: ${BoldOff}"
echo
echo -e "${BoldOn}Encryption Algorithm: ${BoldOff} $cipher"
echo -e "${BoldOn}Common Name: ${BoldOff}          $commonName"
echo -e "${BoldOn}Organization: ${BoldOff}         $org"
echo -e "${BoldOn}Organization Unit: ${BoldOff}    $orgunit"
echo -e "${BoldOn}City: ${BoldOff}                 $city"
echo -e "${BoldOn}State: ${BoldOff}                $state"
echo -e "${BoldOn}Country: ${BoldOff}              $country"
echo
echo
echo -e "${BoldOn}1. Continue to install certificate into Apache ${BoldOff}"
echo -e "${BoldOn}q. Quit ${BoldOff}"
echo
echo -n "Enter the task number: ";


while :
do
	read -s -n1 choice

	case $choice in
	1)
		echo 1
		log "Option chosen to install a certificate into Apache"
		installCert
		break
		;;
	q)
		echo q
		log "Option chosen to quit SSLAssistant tool"
		exit 0
	esac
done


echo "done."
