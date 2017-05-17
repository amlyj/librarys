# tensorflow
> DOC: http://www.tensorfly.cn/tfdoc/get_started/os_setup.html

# install
### Ubuntu/Linux
```
# 仅使用 CPU 的版本
$ pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl

# 开启 GPU 支持的版本 (安装该版本的前提是已经安装了 CUDA sdk)
$ pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl
```

### Mac OS X
> 在 OS X 系统上, 我们推荐先安装 homebrew, 然后执行 brew install python, 以便能够使用 homebrew 中的 Python 安装 TensorFlow. 
另外一种推荐的方式是在 virtualenv 中安装 TensorFlow.
```
# 当前版本只支持 CPU
$ pip install https://storage.googleapis.com/tensorflow/mac/tensorflow-0.5.0-py2-none-any.whl
```

### 基于 Docker 的安装
> 我们也支持通过 Docker 运行 TensorFlow. 该方式的优点是不用操心软件依赖问题.
首先, 安装 Docker. 一旦 Docker 已经启动运行, 可以通过命令启动一个容器:
```
$ docker run -it b.gcr.io/tensorflow/tensorflow
```
>该命令将启动一个已经安装好 TensorFlow 及相关依赖的容器.

### 其它镜像
> 默认的 Docker 镜像只包含启动和运行 TensorFlow 所需依赖库的一个最小集. 我们额外提供了 下面的容器, 
该容器同样可以通过上述 `docker run` 命令安装: `b.gcr.io/tensorflow/tensorflow-full`: 镜像中的 TensorFlow 是从源代码完整安装的, 
包含了编译和运行 TensorFlow 所需的全部工具. 在该镜像上, 可以直接使用源代码进行实验, 而不需要再安装上述的任何依赖.

### 基于 VirtualEnv 的安装
> 我们推荐使用 virtualenv 创建一个隔离的容器, 来安装 TensorFlow. 这是可选的, 但是这样做能使排查安装问题变得更容易.
* 首先, 安装所有必备工具:
```
# 在 Linux 上:
$ sudo apt-get install python-pip python-dev python-virtualenv

# 在 Mac 上:
$ sudo easy_install pip  # 如果还没有安装 pip
$ sudo pip install --upgrade virtualenv
```

* 接下来, 建立一个全新的 virtualenv 环境. 为了将环境建在 ~/tensorflow 目录下, 执行:
```
$ virtualenv --system-site-packages ~/tensorflow
$ cd ~/tensorflow
```

* 然后, 激活 virtualenv:
```
$ source bin/activate  # 如果使用 bash
$ source bin/activate.csh  # 如果使用 csh
(tensorflow)$  # 终端提示符应该发生变化
```
* 在 virtualenv 内, 安装 TensorFlow:
```
(tensorflow)$ pip install --upgrade <$url_to_binary.whl>
```

* 接下来, 使用类似命令运行 TensorFlow 程序:
```
(tensorflow)$ cd tensorflow/models/image/mnist
(tensorflow)$ python convolutional.py

# 当使用完 TensorFlow
(tensorflow)$ deactivate  # 停用 virtualenv

$  # 你的命令提示符会恢复原样
```

### 从源码安装
```
# 安装 Bazel
# 首先依照教程安装 Bazel 的依赖( https://bazel.build/versions/master/docs/install.html ). 
# 然后使用下列命令下载和编译 Bazel 的源码:
$ git clone https://github.com/bazelbuild/bazel.git
$ cd bazel
$ git checkout tags/0.1.0
$ ./compile.sh

# 上面命令中拉取的代码标签为 0.1.0, 兼容 Tensorflow 目前版本. bazel 的HEAD 版本 (即最新版本) 在这里可能不稳定.
# 将执行路径 output/bazel 添加到 $PATH 环境变量中.

# 安装其他依赖
$ sudo apt-get install python-numpy swig python-dev

# 克隆 TensorFlow 仓库
# --recurse-submodules 参数是必须得, 用于获取 TesorFlow 依赖的 protobuf 库.
$ git clone --recurse-submodules https://github.com/tensorflow/tensorflow

### 如果启动GPU支持，先执行GPU配置（见下文GPU支持），再执行安装. ###

# 创建 pip 包并安装
$ bazel build -c opt //tensorflow/tools/pip_package:build_pip_package
$ bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
# .whl 文件的实际名字与你所使用的平台有关
$ pip install /tmp/tensorflow_pkg/tensorflow-0.5.0-cp27-none-linux_x86_64.whl

```

### 启用 GPU 支持
> 如果你使用 pip 二进制包安装了开启 GPU 支持的 TensorFlow, 你必须确保 系统里安装了正确的 CUDA sdk 和 CUDNN 版本. 
* 1.安装CUDA
* 2.需要设置 `LD_LIBRARY_PATH` 和 `CUDA_HOME` 环境变量. 
> 可以考虑将下面的命令 添加到 `~/.bash_profile` 文件中, 这样每次登陆后自动生效. 
注意, 下面的命令 假定 `CUDA` 安装目录为 `/usr/local/cuda`:
```
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64"
export CUDA_HOME=/usr/local/cuda
```

### CUDA 安装
* 1.为了编译并运行能够使用 GPU 的 TensorFlow, 需要先安装 NVIDIA 提供的 Cuda Toolkit 7.0 和 CUDNN 6.5 V2.
> TensorFlow 的 GPU 特性只支持 NVidia Compute Capability >= 3.5 的显卡. 被支持的显卡 包括但不限于:
```
NVidia Titan
NVidia Titan X
NVidia K20
NVidia K40
```
* 2.下载并安装 Cuda Toolkit 7.0  : 
> https://developer.nvidia.com/cuda-toolkit-70
``` 
将工具安装到诸如 `/usr/local/cuda` 之类的路径.
```

* 3.下载并安装 CUDNN Toolkit 6.5 :
> https://developer.nvidia.com/rdp/cudnn-archive (Download cuDNN v2 (March 17,2015), for CUDA 6.5 and later.) 
```
# 解压并拷贝 CUDNN 文件到 Cuda Toolkit 7.0 安装路径下. 假设 Cuda Toolkit 7.0 安装 在 /usr/local/cuda, 执行以下命令:

tar xvzf cudnn-6.5-linux-x64-v2.tgz
sudo cp cudnn-6.5-linux-x64-v2/cudnn.h /usr/local/cuda/include
sudo cp cudnn-6.5-linux-x64-v2/libcudnn* /usr/local/cuda/lib64
```

* 4.如果tensorflow从源码安装，需要以下配置：
> 配置 TensorFlow 的 Cuba 选项
```
# 从源码树的根路径执行:

$ ./configure
Do you wish to bulid TensorFlow with GPU support? [y/n] y
GPU support will be enabled for TensorFlow

Please specify the location where CUDA 7.0 toolkit is installed. Refer to
README.md for more details. [default is: /usr/local/cuda]: /usr/local/cuda

Please specify the location where CUDNN 6.5 V2 library is installed. Refer to
README.md for more details. [default is: /usr/local/cuda]: /usr/local/cuda

Setting up Cuda include
Setting up Cuda lib64
Setting up Cuda bin
Setting up Cuda nvvm
Configuration finished

# 这些配置将建立到系统 Cuda 库的符号链接. 每当 Cuda 库的路径发生变更时, 必须重新执行上述 步骤, 否则无法调用 bazel 编译命令.
# 编译目标程序, 开启 GPU 支持
# 从源码树的根路径执行:

$ bazel build -c opt --config=cuda //tensorflow/cc:tutorials_example_trainer

$ bazel-bin/tensorflow/cc/tutorials_example_trainer --use_gpu
# 大量的输出信息. 这个例子用 GPU 迭代计算一个 2x2 矩阵的主特征值 (major eigenvalue).
# 最后几行输出和下面的信息类似.
000009/000005 lambda = 2.000000 x = [0.894427 -0.447214] y = [1.788854 -0.894427]
000006/000001 lambda = 2.000000 x = [0.894427 -0.447214] y = [1.788854 -0.894427]
000009/000009 lambda = 2.000000 x = [0.894427 -0.447214] y = [1.788854 -0.894427]
# 注意, GPU 支持需通过编译选项 "--config=cuda" 开启.

```

