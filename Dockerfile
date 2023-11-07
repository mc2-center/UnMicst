FROM jupyter/tensorflow-notebook:latest
RUN pip install scikit-image matplotlib tifffile pynvml czifile==2019.7.2 nd2reader==3.2.3 imagecodecs

COPY . /app

# Create the directories and set permissions
RUN mkdir -p /app/models/nucleiDAPILAMIN && \
    mkdir -p /app/models/nucleiDAPI1-5 && \
    chmod -R 777 /app/models/

RUN curl -f -o /app/models/nucleiDAPILAMIN/model.ckpt.data-00000-of-00001 https://mcmicro.s3.amazonaws.com/models/unmicst2/model.ckpt.data-00000-of-00001
RUN curl -f -o /app/models/nucleiDAPI1-5/model.ckpt.data-00000-of-00001 https://mcmicro.s3.amazonaws.com/models/unmicst1-5/model.ckpt.data-00000-of-00001
