import boto3
from meta.meta import *
from boto3.dynamodb.conditions import Key

dynamodb = boto3.client('dynamodb', region_name='us-east-2', aws_access_key_id=key, aws_secret_access_key=secret)

# Add User
# ------------------------------------------------------------------------------
def add_user(email, name, phone, gender):
    '''
    Adds user to Users table with their unique id and sign-up info
    :param unique_id: unique id associated with user
    :param name: first name of user
    :param phone: phone number of user
    :param gender: gender of user
    :return:  dict containing capacity united used and other operation info
    '''
    table = "Users" # Controls which table to add to

        # The process to add a user
    response = dynamodb.put_item(
        
        TableName=table, # Holds the table name
        
        # The part being added
        Item={
            "email":{ 

                "S": email

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
def delete_user(email):
    '''
    Deletes a user from table based on their unique id
    :param unique_id: unique id associated with user
    :return: dict containing capacity united used and other deletion info
    '''
    table = "Users" # Table to be removed from

    # Way to delete users
    response = dynamodb.delete_item(
    
        TableName=table,
    
        Key={ # Unique ID to remove
            "email":{
            "S": email
            }
        }
    )
    return response

# ------------------------------------------------------------------------------
# Get User Info
# ------------------------------------------------------------------------------
def get_user(email):
    '''
    Function gets data associated with a user
    :param unique_id: unique_id of user
    :return: dict containing data associated with user
    '''
    table = 'Users' # Table being retrieved from
    # Operation to get user info
    response = dynamodb.get_item(
        Key={
            'email': {
                'S': email,
            }
        },
        TableName=table,
    )
    return response

