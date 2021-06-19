from pandas import read_csv
import re
import boto3
import os

regex = '^[a-z0-9]+[\._]?[a-z0-9]+[@]\w+[.]\w{2,3}$'  

def download(bucket_name, object_name):
    localfilename='file.csv'
    print(os.environ.get('ACCESS_KEY_ID'))

    s3 = boto3.client('s3',aws_access_key_id='AKIAU6ZPXU5L566PDKY6',
        aws_secret_access_key= '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')
    s3.download_file(bucket_name, object_name, localfilename)
    readcsv(localfilename,'Email')

def readcsv(file_name, column_name=None):
    try:
        # reading CSV file
        data = read_csv(file_name)
        
        # loop through all columns and insert into list, when column_name is None (default value)
        if column_name == None or column_name == "":
            all_data = []
            for (columnName, columnData) in data.iteritems():
                all_data.append(columnData.values)
            return all_data

        # converting column data to list individually
        selectedcol = data[column_name].tolist()
        checkemail(selectedcol)
    except Exception as e:
        print(e)
        return {"statusCode":500, "message":e}

def checkemail(selectedcol):
    for x in selectedcol:
        if re.search(regex,x):   
            pass   
        else:   
            print("Invalid Email : " + str(x))

download('testbucketcsvdownload','emails.csv')

# print(readcsv("file1.csv","Manager"))
# print(readcsv("file1.csv","gender"))
# print(readcsv("file1.csv",""))
# print(readcsv("file1.csv"))