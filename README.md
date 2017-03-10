# file-reader
a python file reader for [robotframework](http://robotframework.org/)

## Installation

```
$ pip install robotframework
$ pip install openpyxl
$ pip install PyPDF2
````

## Usage
Refer to demo.txt

## Documentation


### Excel -- XlsxLibrary

**read_multiple_records**

*[Arguments]*

path, keyDict, hasHeader=True, debug=False

*[Documentation]*

Reads multiple records in xlsx. Returns a list of dictionary.

**read_single_record**

*[Arguments]*

path, keyDict, row='1', debug=False

*[Documentation]*  Reads the record defined by the row in xlsx. Returns a list of one dictionary item.

**read_single_row**

*[Arguments]*  path, keyDict, row='1', debug=False

[Documentation]*  Reads the record defined by the row in xlsx. Returns a list of attributes.


### PDF -- PdfLibrary

[Sample pdf](https://pdfimages.wondershare.com/forms-templates/teacher-resume-template-1.pdf)

**read_page**
*[Arguments]*

path, page=1, password=None, debug=False


[Documentation]*

Reads text from the pdf.
