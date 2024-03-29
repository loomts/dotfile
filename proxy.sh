export hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
export wslip=$(hostname -I | awk '{print $1}')
port=6000

PROXY_HTTP="http://${hostip}:${port}"
PROXY_SOCKS5="socks5://${hostip}:${port}"
set_proxy(){
    export http_proxy="${PROXY_HTTP}"
    export HTTP_PROXY="${PROXY_HTTP}"

    export https_proxy="${PROXY_HTTP}"
    export HTTPS_PROXY="${PROXY_HTTP}"

    export ALL_PROXY="${PROXY_SOCKS5}"
    export all_proxy=${PROXY_SOCKS5}
}

unset_proxy(){
    unset http_proxy
    unset HTTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY
    unset ALL_PROXY
    unset all_proxy
}

test_setting(){
    echo "Host ip:" ${hostip}
    echo "WSL ip:" ${wslip}
    echo "Current http proxy:" $https_proxy
    echo "Current socks proxy:" $all_proxy
}

if [ "$1" = "set" ]
then
    set_proxy

elif [ "$1" = "unset" ]
then
    unset_proxy

elif [ "$1" = "test" ]
then
    test_setting
else
    echo "Unsupported arguments.
    	  try to press 'proxy ' + 'set'||'unset'||'test'"
fi
