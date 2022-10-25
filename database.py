import boto3
from meta import *
from boto3.dynamodb.conditions import Key

dynamodb = boto3.client('dynamodb', region_name='us-east-2', aws_access_key_id=key, aws_secret_access_key=secret)

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
            "unique_id":{ 

                "S": unique_id

            },
            "name": {

                "S": name
            },
            "phone": {

                "S": phone
            },

            "gender": {

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
            "unique_id":{
            "S": unique_id
            }
        }
    )
    return response
# ------------------------------------------------------------------------------
# Get User Info
# ------------------------------------------------------------------------------
def get_user(unique_id):
    
    table = 'Users' # Table being retrieved from

    # Operation to get user info
    response = dynamodb.get_item(
        Key={
            'unique_id': {
                'S': unique_id,
            }
        },
        TableName=table,
    )
    return response