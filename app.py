from utils import add_numbers
from config import API_KEY
import argparse
import sys


def check_config() -> bool:
    if API_KEY == "INVALID":
        print("Configuration check failed: API_KEY is INVALID")
        return False
    print("Configuration check passed")
    return True


def main():
    result = add_numbers(2, 3)
    print(f"Calculation result: {result}")
    if not check_config():
        raise ValueError("Invalid API_KEY")
    print("App running successfully!")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--check-config", action="store_true", help="Run configuration checks and exit")
    args = parser.parse_args()
    if args.check_config:
        ok = check_config()
        sys.exit(0 if ok else 1)
    main()
