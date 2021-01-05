def calculateNetIncome(gross, state):
    """
    Calculate the net income after federal and state tax
    :param gross:   Gross Income
    :param state:   State Name
    :return:    Net Income
    """
    state_tax = {'CA': 10, 'NY': 9, 'TX': 0, 'NJ': 6}

    # Calculate net income after federal tax (federal tax = .10)
    net = gross - (gross * .10)

    # Calculate net income after state tax
    if state in state_tax:
        net = net - (gross * state_tax[state] / 100)
        print("Your net income after all the heavy taxes is: " + str(net))
        return net
    else:
        print("State not in the list")
        return None


income = calculateNetIncome(1000, 'CA')
print("income ", income)
calculateNetIncome(1000, 'ca')
