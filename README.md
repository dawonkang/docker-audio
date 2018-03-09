# docker-audio
Recognizing Audio with Anaconda2-5.1.0-Linux-x86_64

https://medium.freecodecamp.org/how-to-use-sound-classification-with-tensorflow-on-an-iot-platform-8997eb7bbdef

# run docker
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
https://storage.googleapis.com/audioset/vggish_model.ckpt
https://storage.googleapis.com/audioset/vggish_pca_params.npz

# train
python train.py --train_data_pattern=/Volumes/Data/Work/docker-audio/models/audioset_v1_embeddings/bal_train/*.tfrecord --frame_features=True --model=FrameLevelLogisticModel --feature_names="audio_embedding" --feature_sizes="128" --batch_size="512" --num_epochs="1000" --learning_rate_decay_examples="400000" --num_classes="527" --train_dir=/Volumes/Data/Work/docker-audio/models/logs --start_new_model

# eval
python eval.py --eval_data_pattern=/Volumes/Data/Work/docker-audio/models/audioset_v1_embeddings/eval/*.tfrecord --frame_features=True --model=FrameLevelLogisticModel --feature_names="audio_embedding" --feature_sizes="128" --batch_size="512" --num_epochs="1000" --learning_rate_decay_examples="400000" --num_classes="527" --train_dir=/Volumes/Data/Work/docker-audio/models/logs --run_once=True

# packages
https://s3.amazonaws.com/audioanalysis/models.tar.gz
