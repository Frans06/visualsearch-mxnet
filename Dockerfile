FROM mxnet/python

RUN apt-get update && apt-get install -y git

RUN apt-get install build-essential \
		    g++ \
		    python-dev \
		    python-pip \
		    -y

RUN pip install jupyter \
		numpy \
		matplotlib

RUN git clone https://github.com/nmslib/hnsw \
    && cd hnsw  \
    && pip install pybind11 numpy setuptools \
    && cd python_bindings \
    && python setup.py install

COPY . /root/code 

WORKDIR /root/code

CMD jupyter notebook --ip 0.0.0.0 --allow-root
