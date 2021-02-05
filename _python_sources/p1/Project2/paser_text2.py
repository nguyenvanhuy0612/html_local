import re
import pandas as pd


def parse(filepath):
    """
    Parse text at given filepath

    Parameters
    ----------
    filepath : str
        Filepath for file to be parsed

    Returns
    -------
    data : pd.DataFrame
        Parsed data

    """

    data = []
    with open(filepath, 'r') as file:
        line = next(file)
        while line:
            reg_match = _RegExLib(line)

            if reg_match.school:
                school = reg_match.school.group(1)

            if reg_match.grade:
                grade = reg_match.grade.group(1)
                grade = int(grade)

            if reg_match.name_score:
                value_type = reg_match.name_score.group(1)
                line = next(file, None)
                while line and line.strip():
                    number, value = line.strip().split(',')
                    value = value.strip()
                    dict_of_data = {
                        'School': school,
                        'Grade': grade,
                        'Student number': number,
                        value_type: value
                    }
                    data.append(dict_of_data)
                    line = next(file, None)

            line = next(file, None)

        data = pd.DataFrame(data)
        data.set_index(['School', 'Grade', 'Student number'], inplace=True)
        # consolidate df to remove nans
        data = data.groupby(level=data.index.names).first()
        # upgrade Score from float to integer
        data = data.apply(pd.to_numeric, errors='ignore')
    return data


class _RegExLib:
    """Set up regular expressions"""
    # use https://regexper.com to visualise these if required
    _reg_school = re.compile('School = (.*)\n')
    _reg_grade = re.compile('Grade = (.*)\n')
    _reg_name_score = re.compile('(Name|Score)')
    __slots__ = ['school', 'grade', 'name_score']

    def __init__(self, line):
        # check whether line has a positive match with all of the regular expressions
        self.school = self._reg_school.match(line)
        self.grade = self._reg_grade.match(line)
        self.name_score = self._reg_name_score.search(line)


if __name__ == '__main__':
    filepath = 'data/simple_text.txt'
    data = parse(filepath)
    print(data)
