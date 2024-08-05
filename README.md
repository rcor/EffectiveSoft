# EffectiveSoft


## Architecture 
![Architecture Diagram](./assets/test.drawio.svg)



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
  
## Pipeline Diagram 
![Pipeline Diagram](./assets/Pipeline.drawio.svg)

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

## AWS Costs Estimated 

The follow information include an estimated values of the infraestructure in the region of Ohio. The anual costs is **197.40** dollars and by monthly is  **16.45**

| | | | | | | | | | | | | | | | | | | | | | | | |
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
|Name|Total Cost| | |Metadata| | | | |Groups| | | | | | | | | | | | | | |
| |monthly|upfront|12 months|Currency|Locale|Created On|Legal Disclaimer|Share Url|Services| | | | | | | | | | | | | | |
| | | | | | | | | |Service Name|Region|Status|Service Cost| | |Properties| | | | | | | | |
| | | | | | | | | | | | |monthly|upfront|12 months|DT Inbound: Internet|DT Outbound: Not selected|Amount of data stored|Operating system|CPU Architecture|Average duration|Number of tasks or pods|Amount of ephemeral storage allocated for Amazon ECS|Number of Application Load Balancers|
|My Estimate|16.45|0.00|197.40|USD|en_US|8/5/2024|AWS Pricing Calculator provides only an estimate of your AWS fees and doesn't include any taxes that might apply. Your actual fees depend on a variety of factors, including your actual usage of AWS services.|https://calculator.aws/#/estimate?id=968852a3a2762e69fa4f0538d9c29da3800d8e29|Amazon Elastic Container Registry|US East (Ohio)||0.00|0.00|0.01|1 GB per month|0 TB per month|0.012 GB per month| | | | | | |
| | | | | | | | | |AWS Fargate|US East (Ohio)||0.00|0.00|0.00| | | |Linux|x86|1 minutes|1 per day|20 GB| |
| | | | | | | | | |Application Load Balancer|US East (Ohio)||16.45|0.00|197.40| | | | | | | | |1|
