# We will use Ubuntu for our image
FROM ubuntu
# Updating Ubuntu packages
RUN apt-get update && yes|apt-get upgrade
# Adding wget and bzip2
RUN apt-get install -y wget bzip2
# Adding git
RUN apt-get install -y git
# Anaconda installing
RUN wget https://repo.continuum.io/archive/Anaconda2-5.3.1-Linux-x86_64.sh
RUN bash Anaconda2-5.3.1-Linux-x86_64.sh -b
RUN rm Anaconda2-5.3.1-Linux-x86_64.sh
# Set path to conda
ENV PATH /root/anaconda2/bin:$PATH
# Updating Anaconda packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all
#install tensorflow keras
RUN pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.12.0-cp27-none-linux_x86_64.whl
RUN pip install --ignore-installed --upgrade keras
RUN pip install --ignore-installed --upgrade coremltools
RUN pip install --ignore-installed --upgrade selenium
RUN pip install --ignore-installed --upgrade jupyter_contrib_nbextensions
# Configuring access to Jupyter
RUN mkdir /opt/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py
RUN jupyter contrib nbextension install
# Jupyter listens port: 8888
EXPOSE 8888
# Run Jupyter notebook as Docker main process
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/opt/notebooks", "--ip='0.0.0.0'", "--port=8888", "--no-browser"]
