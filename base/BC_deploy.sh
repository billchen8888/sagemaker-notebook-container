export CONTAINER_NAME=sagemaker-notebook-container
#export IMAGE_NAME=qtangs/sagemaker-notebook:tensorflow-p36
#export IMAGE_NAME=qtangs/sagemaker-notebook:python3-pytorch-p36
export IMAGE_NAME=bcsagemaker
export WORKDDIR=/home/ec2-user
export AWS_PROFILE=default-api

##chmod 666 /var/run/docker.dock   the default  660 should work

docker run -t --name=sagemakelocal \
           -p 8888:8888 \
           -e AWS_PROFILE=${AWS_PROFILE} \
           -v ~/.aws:/home/ec2-user/.aws:ro \
	   -v /var/run/docker.sock:/var/run/docker.sock \
           -v /home/ec2-user/data:/home/ec2-user/SageMaker \
           -v /tmp:/tmp \
           ${IMAGE_NAME} 

           # -v /var/run/docker.sock:/var/run/docker.sock:rw \

# inside the /var/docker/docker.sock  is 755, root:root
# how can I  set the mode inside the container,  or change the owner???

# qtangs deploy script doesn't have -v /tmp:/tmp

# I added -v /tmp:/tmp is required as the docker-compose in this case will invoke the train container in OS, then we need a mechanism to let the OS docker deamon
# to see the docker-compose.yaml file generated in the jupyter container.
# the jupyterlab container dynamically generated a /tmp/tmp####/docker-sompose.yaml file like the following:

#networks:
#  sagemaker-local:
#    name: sagemaker-local
#services:
#  algo-1-38ewq:
#    command: train
#    container_name: izdtx1p18o-algo-1-38ewq
#    environment:
#    - AWS_ACCESS_KEY_ID=ASIA22PBLLXFKVKZCEUK
#    - AWS_SECRET_ACCESS_KEY=zjTM1nREV92lecjibwWBNjSTl6Cb/GX1tLvzkdbI
#    - AWS_SESSION_TOKEN=I######
#    - AWS_REGION=us-west-2
#    - TRAINING_JOB_NAME=pytorch-training-2022-05-29-17-01-05-821
#    image: 763104351884.dkr.ecr.us-west-2.amazonaws.com/pytorch-training:1.7.1-cpu-py3
#    networks:
#      sagemaker-local:
#        aliases:
#        - algo-1-38ewq
#    stdin_open: true
#    tty: true
#    volumes:
#    - /tmp/tmp8dqhyqu2/algo-1-38ewq/input:/opt/ml/input
#    - /tmp/tmp8dqhyqu2/algo-1-38ewq/output:/opt/ml/output
#    - /tmp/tmp8dqhyqu2/algo-1-38ewq/output/data:/opt/ml/output/data
#    - /tmp/tmp8dqhyqu2/model:/opt/ml/model
#    - /tmp/tmpzko3b7u7:/opt/ml/input/data/training
#version: '2.3'
