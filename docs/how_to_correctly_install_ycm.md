# first step

* clone repos

    ```
    git clone https://github.com/Valloric/YouCompleteMe.git
    ```

* or use `vundle` to install

# update submodule

```
cd /path/to/path/YouCompleteMe.git && git submodule update --init --recursive
```
# use `install.py` to install 

```
cd /path/to/path/YouCompleteMe.git && ./install.py --clang-completer --gocode-completer
```

It's done.
