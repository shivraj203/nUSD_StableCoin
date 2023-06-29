# nUSD_StableCoin
To run the project and interact with the nUSD stablecoin, follow these steps:

1. Install dependencies:
   - Open a terminal or command prompt.
   - Navigate to the project directory.
   - Run the following command to install the required dependencies:
     ```
     npm install
     ```

2. Configure the project:
    - Open the `config.js` file in the project directory.
    - Update the `priceFeedAddress` variable with the actual Chainlink price feed address you want to use.

3. Update the Frontend file:
    - Open the `index.html` file in the project directory.
    - Update the `contracAdress` and `contractABI` variable.

3. Compile the Smartcontract and Deploy it to local server Ganache:
   - Run the following command to compile the contract:
     ```
     truffle compile
     ```
   - Run the following command to deploy the contract:
     ```
     truffle migrate --network development
     ```
    
3. Run the project:
   - In the terminal or command prompt, navigate to the project directory.
   - Run the following command to start the local development server:
     ```
     npm run start
     ```

6. Access the frontend:
   - Open your web browser.
   - Visit `http://localhost:3000` to access the nUSD stablecoin frontend.

Interacting with the frontend:
- The frontend provides a simple user interface to interact with the nUSD stablecoin.
- You can enter the amount of ETH you want to deposit in the "ETH amount" input field and click the "Deposit" button to deposit ETH and receive nUSD.
- To redeem nUSD and receive ETH, click the "Redeem" button.
- The total supply of nUSD is displayed in the "Total nUSD Supply" section.
