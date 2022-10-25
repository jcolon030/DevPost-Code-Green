import boto3
from meta.meta import *
from boto3.dynamodb.conditions import Key

dynamodb = boto3.client("dynamodb", region_name='us-east-2', aws_access_key_id=key, aws_secret_access_key=secret)

# Add User
# ------------------------------------------------------------------------------
def add_user(unique_id, name, phone, gender):
    '''
    Function allowing users to be added to DynamoDB (AWS)
    Parameters: Unique ID, Name, Phone, Gender.
    Returns: User added to Users Table.

    '''
    table = "Users" # Controls which table to add to

    # The process to add a user
    response = dynamodb.put_item(
    
    TableName=table, # Holds the table name
    
    # The part being added
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

# ------------------------------------------------------------------------------

# Delete User
# ------------------------------------------------------------------------------
def delete_user(unique_id):
    '''
    Function allowing users to be deleted.
    Parameters: Unique ID.
    Returns: User gets removed from Users table.

    '''
    table = "Users" # Table to be removed from

    # Way to delete users
    response = dynamodb.delete_item(
    
    TableName=table,
    
    Key={ # Unique ID to remove
        "Unique ID":{

            "S": unique_id

        }
    }
)
            
              

    return response
# ------------------------------------------------------------------------------