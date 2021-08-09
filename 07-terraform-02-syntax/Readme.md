# Домашнее задание к занятию "7.2. Облачные провайдеры и синтаксис Терраформ."

## Задача 1. Регистрация в aws и знакомство с основами (необязательно, но крайне желательно).

1. Устанавливаю aws-cli `pip install awscli`
3. 
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
1. Внимание! В гит репозиторий нельзя пушить ваши личные ключи доступа к аккаунта. Поэтому в предыдущем задании мы указывали
их в виде переменных окружения. 
1. В файле `main.tf` воспользуйтесь блоком `data "aws_ami` для поиска ami образа последнего Ubuntu.  
1. В файле `main.tf` создайте рессурс [ec2 instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance).
Постарайтесь указать как можно больше параметров для его определения. Минимальный набор параметров указан в первом блоке 
`Example Usage`, но желательно, указать большее количество параметров. 
1. Добавьте data-блоки `aws_caller_identity` и `aws_region`.
1. В файл `outputs.tf` поместить блоки `output` с данными об используемых в данный момент: 
    * AWS account ID,
    * AWS user ID,
    * AWS регион, который используется в данный момент, 
    * Приватный IP ec2 инстансы,
    * Идентификатор подсети в которой создан инстанс.  
1. Если вы выполнили первый пункт, то добейтесь того, что бы команда `terraform plan` выполнялась без ошибок. 


В качестве результата задания предоставьте:
1. Ответ на вопрос: при помощи какого инструмента (из разобранных на прошлом занятии) можно создать свой образ ami?
1. Ссылку на репозиторий с исходной конфигурацией терраформа.  
