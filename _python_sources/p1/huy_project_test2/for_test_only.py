import csv


# csv.writer(csvfile, dialect='excel', **fmtparams
def write_to_csv():
    import csv
    with open('eggs.csv', 'w', newline='') as csvfile:
        spamwriter = csv.writer(csvfile, delimiter=' ',
                                quotechar='|', quoting=csv.QUOTE_MINIMAL)
        spamwriter.writerow(['Spam'] * 5 + ['Baked Beans'])
        spamwriter.writerow(['Spam', 'Lovely Spam', 'Wonderful Spam'])


def temp():
    print(['Spam'] * 5 + ['Baked Beans'])
temp()
# write_to_csv()