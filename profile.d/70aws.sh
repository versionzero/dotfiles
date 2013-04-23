##
# aws.sh - Amazon WebSevices Tools
##

export JAVA_HOME="$(/usr/libexec/java_home)"

EC2_HOME="$HOME"/.ec2
if [ -d "$EC2_HOME" ]; then
    export EC2_PRIVATE_KEY="$(/bin/ls "$EC2_HOME"/pk-*.pem | /usr/bin/head -1)"
    export EC2_CERT="$(/bin/ls "$EC2_HOME"/cert-*.pem | /usr/bin/head -1)"
    export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
fi

##
# EOF
##
