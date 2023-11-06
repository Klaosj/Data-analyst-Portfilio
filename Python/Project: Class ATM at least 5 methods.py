##HW02 Class ATM at least 5 methods

##Class ATM
class ATM:
    def __init__(self,deposit,withdraw,passcode,account):
        self.deposit = deposit
        self.withdraw = withdraw
        self.passcode = passcode
        self.saving = self.deposit- self.withdraw
        self.account = account
        #method
    def add_money(self):
        atm_pass = input("Enter your passcode: ")
        if atm_pass == str(self.passcode):
            print(f"Processing the deposit: {self.deposit}")
        else:
            print("Incorrect passcode. Please try again.")

    def withdraw_money(self):
        atm_pass = input("Enter your passcode: ")
        if atm_pass == str(self.passcode):
            print(f"Processing the withdraw : {self.withdraw}")
        else:
            print("Incorrect passcode. Please try again.")

    def show_passcode(self):
        atm_pass = input("Enter your passcode: ")
        if atm_pass == str(self.passcode):
            print(f"passcode : {self.passcode}")
        else:
            print("Incorrect passcode. Please try again.")
    def saving_money(self):
        atm_pass = input("Enter your passcode: ")
        if atm_pass == str(self.passcode):
            print(f"saving :" , self.deposit -self.withdraw)
        else:
            print("Incorrect passcode. Please try again.")
    def account_n(self):
        atm_pass = input("Enter your passcode: ")
        if atm_pass == str(self.passcode):
            print(f"account number : {self.account}")
        else:
            print("Incorrect passcode. Please try again.")
atm1 = ATM(1000, 0, 1234,"873-739-384")
atm2 = ATM(2330,455,1412,"544-525-486")
atm2.saving
