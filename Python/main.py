import requests, base64, math


# Gets Table from  Business Central via webservice
def get_BC_table():
    # enters the Credentials (quite unsafe bc the credentials sre written here for everyone to see)
    username = "admin"
    password = "P@ssw0rd"

    credentials = f"{username}:{password}"
    encoded_credentials = base64.b64encode(credentials.encode("utf-8")).decode("utf-8")

    headers = {
        "Authorization": f"Basic {encoded_credentials}",
        "Content-Type": "application/json",
    }
    # the OData V4 URL which leads to the Query with the Dataset we are looking for
    url = "http://bcserver-default:7048/BC/ODataV4/Company('CRONUS%20USA%2C%20Inc.')/GetIrisviaQuery?tenant=bcserver-default"
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        return response.json()
    else:
        print("Error", response.reason)


# processes the incoming not very useful format into an array
def calculated_value(table):
    # Programm appends every column except for the first one which is just the Primary Key (Code)
    columns = [
        column for column in table["value"][0].keys() if column != "AuxiliaryIndex1"
    ]
    rows = [[item[column] for column in columns] for item in table["value"]]
    return rows


# neaeres Neighbor Alg to analyze Data
def nearest_neighbor_fit(table_data):
    data = []
    target = []
    for i in table_data:
        target.append(i[len(i) - 1])
        temp = []
        for j in range(len(i) - 1):
            temp.append(i[j])
        data.append(temp)
    return data, target


def nearest_neighbor_predict(data, target, predict):
    lowest_difference = None
    lowest_difference_array_class = 0
    for i, k in zip(data, target):
        difference = 0
        for j, l in zip(i, predict):
            j = float(j)
            difference += math.dist((j,), (l,))
        if lowest_difference == None or difference < lowest_difference:
            lowest_difference = difference
            lowest_difference_array_class = k
    return lowest_difference_array_class


if __name__ == "__main__":
    # calls function to retrieve data via API
    table = get_BC_table()
    # calls Function to turn data into array
    table_data = calculated_value(table)
    # calls function to split dataset into data and target
    data, target = nearest_neighbor_fit(table_data)
    # calls function to predit this little Test (should be 3)
    test_predict = [6.7, 3.1, 5.6, 2.4]
    print(nearest_neighbor_predict(data, target, test_predict))
