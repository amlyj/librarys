#安装tornado


###解压
```shell
ThinkPad-E450:~$ tar zxvf tornado-4.4.2.tar.gz
```

###安装
```shell
ThinkPad-E450:~$ cd tornado-4.4.2/
ThinkPad-E450:~/tornado-4.4.2$ python setup.py install
```

###tornado依赖:
Debian and Ubuntu users should issue the following command:

    $ sudo apt-get install build-essential python-dev

RedHat and CentOS users should issue the following command:

    $ sudo yum install gcc python-devel

Fedora users should issue the following command:

    $ sudo dnf install gcc python-devel

alpine 
   
    $ apk add gcc python python-dev musl-dev linux-headers libgcc py-pip && pip install singledispatch backports_abc

