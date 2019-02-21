
# crazy.  Default to utf-8  (try this as of 130701)
export __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100


# Select python virtualenv
# run  conda config --set changeps1 false to remove (dir) prompt addition
#echo $PATH
case `hostname` in
    mambo*)
        source ~/anaconda/bin/activate brian_mkl
        ;;
    *)
        echo Hostname not found
        # canopy default setup is here:
        #source ~/Library/Enthought/Canopy_64bit/User/bin/activate ~/Library/Enthought/Canopy_64bit/User
esac


# execute other/local bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# anaconda enable
. /Users/histed/anaconda3/etc/profile.d/conda.sh
