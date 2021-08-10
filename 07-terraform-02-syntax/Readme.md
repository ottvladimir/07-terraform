# Домашнее задание к занятию "7.2. Облачные провайдеры и синтаксис Терраформ."

## Задача 1. Регистрация в aws и знакомство с основами (необязательно, но крайне желательно).

1. Устанавливаю aws-cli `pip install awscli`
      ```bash
            $ aws configure list
               Name                    Value             Type    Location
               ----                    -----             ----    --------
               profile                <not set>             None    None
               access_key     ****************CM34 shared-credentials-file    
               secret_key     ****************LtDk shared-credentials-file    
               region                us-west-2      config-file    ~/.aws/config
      ```
4.   Создал IAM политику для терраформа c правами     
       ```json
       
          $ aws iam list-attached-user-policies --user-name terraform
       
       
            {
                "AttachedPolicies": [
                    {
                        "PolicyName": "AmazonRDSFullAccess",
                        "PolicyArn": "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
                    },
                    {
                        "PolicyName": "AmazonEC2FullAccess",
                        "PolicyArn": "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
                    },
                    {
                        "PolicyName": "IAMFullAccess",
                        "PolicyArn": "arn:aws:iam::aws:policy/IAMFullAccess"
                    },
                    {
                        "PolicyName": "AmazonS3FullAccess",
                        "PolicyArn": "arn:aws:iam::aws:policy/AmazonS3FullAccess"
                    },
                    {
                        "PolicyName": "CloudWatchFullAccess",
                        "PolicyArn": "arn:aws:iam::aws:policy/CloudWatchFullAccess"
                    },
                    {
                        "PolicyName": "AmazonDynamoDBFullAccess",
                        "PolicyArn": "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
                    }
                ]
            }
       ```
5. Добавьте переменные окружения  
      ```bash
          export AWS_ACCESS_KEY_ID=(my access key id)
          export AWS_SECRET_ACCESS_KEY=(my secret access key)
        
          $ aws configure list
          Name                    Value             Type    Location
          ----                    -----             ----    --------
          profile                <not set>             None    None
          access_key     ****************CM34              env    
          secret_key     ****************LtDk              env    
          region                us-west-2      config-file    ~/.aws/config
      ```  
## Задача 2. Созданием ec2 через терраформ. 

1. В каталоге `terraform` вашего основного репозитория, который был создан в начале курсе, создайте файл `main.tf` и `versions.tf`.
1. Зарегистрируйте провайдер для [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs). В файл `main.tf` добавьте
блок `provider`, а в `versions.tf` блок `terraform` с вложенным блоком `required_providers`. Укажите любой выбранный вами регион 
внутри блока `provider`.
  ```
      provider "aws" {
        region = "us-west-2"
      }

      data "aws_ami" "ubuntu" {
        owners = ["amazon"]
        most_recent = true
        filter {
              name   = "name"
              values = ["*ubuntu*"]
              }
      }
      resource "aws_instance" "web" {
          ami = "${data.aws_ami.ubuntu.id}"
          instance_type = "t2.micro"
      }
  ```
ami собирается при помощи packer
