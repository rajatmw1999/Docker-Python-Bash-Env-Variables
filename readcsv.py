# pandas is used as it makes parsing of csv very easier and customizable compared to csv module
from pandas import read_csv

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
        return selectedcol
    except Exception as e:
        print(e)
        return {"statusCode":500, "message":e}


# print(readcsv("file1.csv","Manager"))
print(readcsv("file1.csv","Name"))
# print(readcsv("file1.csv",""))
# print(readcsv("file1.csv"))