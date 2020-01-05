module "my-ecs"{
source = " "
VPC_ID  = "FROM module.vpc"
CLUSTER_NAME = "my-ecs"
INSTANCE_TYPE = "t2.small"
SSH_KEY_NAME = "${aws_key_pair.mykeypair.key_name}"
VPC_SUBNET  = "${module.vpc.public_subnet}"
ENABLE_SSH = true
SSH_SG = "${from aws}"
LOG_GROUP = " "
AWS_ACCOUNT_ID =  "${current.account.id}"
AWS_REGION = "${aws_region}"
}

module "my_service" {
source  = " "
VPC_ID  = "FROM module.vpc"
APPLICATION_NAME = "my_service"
APPLICATION_PORT = "88"
APPLICATION_VERSION = "letest"
CLUSTER_ARN = "module.my-ecs.cluster_arn"
SERVICE_ROLE_ARN = "module.my-ecs.service_role_arn"
AWS_REGION = "${aws_region}"
HEALTHCHECK_MATCHER ="200"
CPU_RESERVATION = "256"
MEMORY_RESERVATION = "128"
LOG_GROUP = "my-log-group"
DESIRED_COUNT = 2
ALB_ARN =  "${module.my-alb.alb_arn}"

}

module "my-alb" {

source = " "
VPC_ID = ""
ALB_NAME  = "my-alb"
VPC_SUBNETS = "vpc_subnet_id"
DEFAULT_TARGET_ARN = " "
DOMAIN = " "
INTERNAL = false
ECS_SG = "${module.my-ecs.cluster_sg}"
}

module "my-alb-rule" {
source = " "
LISTNER_ARN = "{module}"

}