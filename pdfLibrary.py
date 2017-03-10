import PyPDF2
from robot.api import logger

def load_file(path):
  file = open(path, 'rb')
  reader = PyPDF2.PdfFileReader(file)
  return reader

def log(text, debug):
  if debug:
    logger.console(text)

def read_page(path, page=1, password=None, debug=False):

  reader = load_file(path)

  if ( reader.isEncrypted == True and password != None ):
    password = password.encode('utf-8')
    reader.decrypt(password)

  log(reader.numPages, debug)

  index = int(page) - 1
  if ( index > reader.numPages ):
    index = 0

  log(index, debug)

  text = reader.getPage(index).extractText()

  return text
