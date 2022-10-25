import boto3
from boto3.dynamodb.conditions import Key

dynamodb = boto3.client("dynamodb", region_name='us-east-2', aws_access_key_id="AKIAVC5TF2RTHZTX64QZ", aws_secret_access_key="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")

def add_user(unique_id, name, phone, gender):
    
    table = "Users"
    response = dynamodb.put_item(
    
    TableName=table,
    
    Item={
        "Unique ID":{

            "S": unique_id

        },

        "Name": {

            "S": name
        },

        "Phone": {

            "S": phone

        },

        "Gender": {

            "S": gender
        }
    }          
)
            
              

    return response

