FROM jupyter/datascience-notebook

# Working path
# Extracted through running the image /bin/bash
COPY . /home/jovyan/work
# Giving the image root permessions, mostly for write access
USER root

# Installing used libraries
RUN pip install pandas
RUN pip install matplotlib
RUN pip install seaborn
RUN pip install reportlab

# Exposing port 8888 of the container, this means the device will forward all traffic of 
# the device on port 8888 to the port 8888 of the container
EXPOSE 8888

# Running the notebook
CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root"]