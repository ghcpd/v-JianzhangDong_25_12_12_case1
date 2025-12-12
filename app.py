from utils import add_numbers
from config import API_KEY

def main():
    result = add_numbers(2, 3)
    print(f"Calculation result: {result}")
    if API_KEY == "INVALID":
        raise ValueError("Invalid API_KEY")
    print("App running successfully!")

if __name__ == "__main__":
    main()
