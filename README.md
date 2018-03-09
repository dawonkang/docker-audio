# docker-audio
Recognizing Audio with Anaconda2-5.1.0-Linux-x86_64

docker run --name docker-audio -p 8888:8888 -v "$PWD/notebooks:/opt/notebooks" -v "$PWD/models:/root/models" -d risinsun/docker-audio-auto

# into the container
docker exec -it docker-audio /bin/bash

# for test
docker run --rm -it risinsun/docker-audio-auto /bin/bash

# Tensorflow models
git clone https://github.com/tensorflow/models

# docker commit
docker commit -p -a "Dawon Kang <risinsun2@gmail.com>" -m "add tensorflow models" docker-audio risinsun/docker-audio:0.1

docker push risinsun/docker-audio:0.1

# download Audioset features
http://storage.googleapis.com/asia_audioset/youtube_corpus/v1/features/features.tar.gz

# train
python train.py --train_data_pattern=/Volumes/Data/Work/docker-audio/models/audioset_v1_embeddings/bal_train/*.tfrecord -–num_epochs=100 –-learning_rate_decay_examples=400000 –-feature_names=audio_embedding –-feature_sizes=128 –-frame_features –-batch_size=512 -–num_classes=527 -–train_dir=/Volumes/Data/Work/docker-audio/models/logs –-model=LogisticModel
