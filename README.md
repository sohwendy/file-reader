# file-reader
a python file reader for [robotframework](http://robotframework.org/)

Inspired by [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/)

## Installation

```
$ pip install robotframework
$ pip install openpyxl
$ pip install PyPDF2
````

## Usage
Refer to demo.txt


## Run the test
```
$ pybot spec/*.robot
````

## Documentation

### Excel -- XlsxLibrary

**read_multiple_records**

*Arguments*
path, keyDict, hasHeader=True, debug=False

*Documentation*
Reads multiple records in xlsx. Returns a list of dictionary.

**read_single_record**

*Arguments*
path, keyDict, row='1', debug=False

*Documentation*
Reads the record defined by the row in xlsx. Returns a list of one dictionary item.

**read_single_row**

*Arguments*
path, keyDict, row='1', debug=False

*Documentation*
Reads the record defined by the row in xlsx. Returns a list of attributes.


### PDF -- PdfLibrary

[Sample pdf](https://pdfimages.wondershare.com/forms-templates/teacher-resume-template-1.pdf)

**read_page**

*Arguments*
path, page=1, password=None, debug=False

*Documentation*
Return text from the normal and encrypted pdf.
