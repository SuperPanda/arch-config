# arch-config

## Get list of vim dependencies
```
cd ~/.vim/bundle/start
find -name .git -print -execdir git --git-dir={}/ --work-tree=$PWD/{} remote show origin \; > /tmp/vimbundles.tmp
grep Fetch /tmp/vimbundle.tmp | cut -c 14-  > ~/repo/arch-config/vim-packages.txt
```

