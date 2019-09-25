#export LANGUAGE=en_US.UTF-8
#export LANG=en_US.UTF-8
#expo LC_ALL=en_US.UTF-8
#
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
    
rmswp() {
        rm .*.sw*
}
    
calc() {
    perl -ne '$v=eval, printf("%d %xh %bb %f\n", $v, $v, $v, $v)'
}
    
ffc() { 
    find . -name "*.c" -exec grep -nHw "$1" {} \;
}
     
ffcpp() {
    find . -name "*.cpp" -exec grep -nHw "$1" {} \;
}

ffh() {
    find . -name "*.h" -exec grep -nHw "$1" {} \;
}

ffa() {
    find . -name "*.[chSs]" -exec grep -nHw "$1" {} \;
}

ffm() {
    find . -name "Makefile" -exec grep -nHw "$1" {} \;
}

ffk() {
    find . -name "Kconfig" -exec grep -nH "$1" {} \;
}

wfgitenv() {
    git config --global user.name “jedy.wei”
    git config --global user.email “jedy.wei@advantech.com.tw
    git config --global svn.rmdir true
}

wfgit() {
    echo try to "git svn clone" project "https://batman.advantech.com.tw/svn/scm/ncg/hvs-9201/branches/workflow/$1" to local directory
    read yesno
    if [[ "$yesno" == "y" ]]; then
        git svn clone https://batman.advantech.com.tw/svn/scm/ncg/hvs-9201/branches/workflow/$1
    fi
}

htab() {
    echo "[31-28][27-24][23-20][19-16] - [15-12][11- 8][ 7- 4][ 3- 0]"
    echo
    echo "0-0000, 1-0001, 2-0010, 3-0011"
    echo "4-0100, 5-0101, 6-0110, 7-0111"
    echo "8-1000, 9-1001, a-1010, b-1011"
    echo "c-1100, d-1101, e-1110, f-1111"
    echo
    echo "0x0000_0010   16"
    echo "0x0000_0100   256"
    echo "0x0000_0400   1K"
    echo "0x0000_1000   4K"
    echo "0x0000_4000   16K"
    echo "0x0001_0000   64K"
    echo "0x0004_0000   256K"
    echo "0x0010_0000   1M"
    echo "0x0040_0000   4M"
    echo "0x0100_0000   16M"
    echo "0x1000_0000   256M"
    echo 
}   
    
hex() {
    
    if [[ "$1" == "-h" || "$1" == "-help" ]]; then
        echo "Usage: "
        echo "  hex <file>"
        echo "  hex <file> <offset>"
        return 
    fi

    if [ $# == 1 ]; then
        hexdump -v -n 512 -C $1
    else 
        hexdump -v -n 512 -C -s $2 $1
    fi
}       
     
hexall() {
    if [ $# == 1 ]; then
        hexdump -v -C $1 | more
    else 
        hexdump -v -C -s $2 $1 | more
    fi
}


##
## Main
##

if [[ $- == *i* ]]; then
#    export DISPLAY=172.16.63.1:0.0
    export PS1="[$VIMPROMPT\u@\h \W:${PROJ}]$ "
    source ~/mediaflow/Boreas/projenv.sh
fi

