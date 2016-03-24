import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
handler = logging.FileHandler('/opt/var/log/castget.log')
handler.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s:%(module)s:%(lineno)d:%(levelname)s - %(message)s')
handler.setFormatter(formatter)
logger.addHandler(handler)


def my_func():
    logger.info('Start reading database out')

def main():
    logger.info('Finish updating records')
    my_func()

if __name__ == '__main__':
    import sys
    sys.exit(main())

