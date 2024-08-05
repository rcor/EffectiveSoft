# EffectiveSoft



## Resume

The following repo is just a technical test, it is not a code that is recommended for use in production.

## What is include in the follow repository

* Docker container with a NGINX and html ( the container return in the port 80 a **hello world**)
* Cloudformation Template to deploy an ECR,ECS, ELB, IAM Role
* A PR basic template
* PR Actions
* Deploy Action ( Deploy the cloudformation, publish the docker image in the repository and deploy the app in the ECS tasks)
* Cost of the infraestructure
* Diagram 
  

## How to run locally 

```
docker run -p 80:80 -rm -it $(docker build -q .)
```

## Setup on Github

Set the follow [secrets](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-development-environment-secrets-for-your-repository-or-organization) on github 

|Name|Description|
|----|-----------|
|AWS_ACCESS_KEY_ID|AWS Access Key|
|AWS_SECRET_ACCESS_KEY|AWS Secret Key|
|AWS_REGION|AWS region for example us-east-1|
|VPC_ID|The VPC id for the cluster|
|SUBNETS_ID| List of subnets for the cluster, it is required at least 2 |
|DESIRED_COUNT| By default is 1 |
|REPOSITORY_NAME|The docker registry on AWS Name|


AWS IAM Policy required to deploy the template

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "cloudformation:CreateStack",
        "cloudformation:UpdateStack",
        "cloudformation:DeleteStack",
        "cloudformation:DescribeStacks",
        "cloudformation:DescribeStackResources",
        "cloudformation:DescribeStackEvents",
        "cloudformation:GetTemplate",
        "cloudformation:ValidateTemplate"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:CreateRepository",
        "ecr:DeleteRepository",
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:InitiateLayerUpload",
        "ecr:PutImage",
        "ecr:UploadLayerPart",
        "ecr:DescribeRepositories"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeleteCluster",
        "ecs:DeregisterTaskDefinition",
        "ecs:RegisterTaskDefinition",
        "ecs:DescribeClusters",
        "ecs:DescribeTaskDefinition",
        "ecs:DescribeTasks",
        "ecs:ListClusters",
        "ecs:ListTaskDefinitions",
        "ecs:ListTasks",
        "ecs:UpdateService",
        "ecs:RunTask",
        "ecs:StartTask",
        "ecs:StopTask",
        "ecs:CreateService",
        "ecs:DeleteService",
        "ecs:DescribeServices",
        "ecs:ListServices"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "elasticloadbalancing:CreateLoadBalancer",
        "elasticloadbalancing:DeleteLoadBalancer",
        "elasticloadbalancing:DescribeLoadBalancers",
        "elasticloadbalancing:CreateListener",
        "elasticloadbalancing:DeleteListener",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:CreateTargetGroup",
        "elasticloadbalancing:DeleteTargetGroup",
        "elasticloadbalancing:DescribeTargetGroups",
        "elasticloadbalancing:RegisterTargets",
        "elasticloadbalancing:DeregisterTargets",
        "elasticloadbalancing:DescribeTargetHealth",
        "elasticloadbalancing:DescribeTargetHealth"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "iam:CreateRole",
        "iam:DeleteRole",
        "iam:AttachRolePolicy",
        "iam:DetachRolePolicy",
        "iam:PassRole",
        "iam:GetRole",
        "iam:ListRoles"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeVpcs",
        "ec2:DescribeSubnets",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeRouteTables",
        "ec2:DescribeInstances",
        "ec2:CreateSecurityGroup",
        "ec2:DeleteSecurityGroup",
        "ec2:AuthorizeSecurityGroupIngress",
        "ec2:RevokeSecurityGroupIngress"
      ],
      "Resource": "*"
    }
  ]
}
```


