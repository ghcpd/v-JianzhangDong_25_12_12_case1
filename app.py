import argparse
from utils import add_numbers
from config import API_KEY

def main():
    result = add_numbers(2, 3)
    print(f"Calculation result: {result}")
    if API_KEY == "INVALID":
        raise ValueError("Invalid API_KEY")
    print("App running successfully!")

def check_config():
    if API_KEY == "INVALID":
        raise ValueError("Invalid API_KEY")
    print("Config check passed.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--check-config', action='store_true', help='Check configuration')
    args = parser.parse_args()
    if args.check_config:
        check_config()
    else:
        main()
