const countryList = {
    "USD": "US", "UZS": "UZ", "EUR": "FR", "RUB": "RU",
    "GBP": "GB", "CNY": "CN", "TRY": "TR", "KZT": "KZ",
    "AED": "AE", "KRW": "KR", "JPY": "JP"
};

const fromCurrency = document.getElementById("from-currency");
const toCurrency = document.getElementById("to-currency");
const amountInput = document.getElementById("amount");
const exchangeRateText = document.getElementById("exchange-rate");
const inverseRateText = document.getElementById("inverse-rate");
const lastUpdatedText = document.getElementById("last-updated");
const swapBtn = document.getElementById("swap-btn");
const getBtn = document.getElementById("get-btn");

// Valyuta tanlovlarini to'ldirish
Object.keys(countryList).forEach(currency => {
    let option1 = new Option(currency, currency);
    let option2 = new Option(currency, currency);
    
    if(currency === "USD") option1.selected = true;
    if(currency === "UZS") option2.selected = true;
    
    fromCurrency.add(option1);
    toCurrency.add(option2);
});

function updateFlag(element) {
    let code = element.value;
    let countryCode = countryList[code];
    let imgTag = element.parentElement.querySelector("img");
    imgTag.src = `https://flagcdn.com/w40/${countryCode.toLowerCase()}.png`;
}

fromCurrency.addEventListener("change", (e) => {
    updateFlag(e.target);
    getExchangeRate();
});

toCurrency.addEventListener("change", (e) => {
    updateFlag(e.target);
    getExchangeRate();
});

async function getExchangeRate() {
    let amountVal = amountInput.value;
    if(amountVal === "" || amountVal === "0") {
        amountInput.value = "1";
        amountVal = 1;
    }

    exchangeRateText.innerText = "Kurs olinmoqda...";

    try {
        let url = `https://open.er-api.com/v6/latest/${fromCurrency.value}`;
        let response = await fetch(url);
        let result = await response.json();
        
        let exchangeRate = result.rates[toCurrency.value];
        let totalExRate = (amountVal * exchangeRate).toLocaleString('en-US', {maximumFractionDigits: 2});
        
        exchangeRateText.innerText = `${amountVal} ${fromCurrency.value} = ${totalExRate} ${toCurrency.value}`;
        
        let inverseRate = (1 / exchangeRate).toFixed(6);
        inverseRateText.innerText = `1 ${toCurrency.value} = ${inverseRate} ${fromCurrency.value}`;
        
        let now = new Date();
        lastUpdatedText.innerText = `Oxirgi yangilanish: ${now.toLocaleTimeString()}`;
    } catch (error) {
        exchangeRateText.innerText = "Xatolik yuz berdi!";
    }
}

swapBtn.addEventListener("click", () => {
    let tempCode = fromCurrency.value;
    fromCurrency.value = toCurrency.value;
    toCurrency.value = tempCode;
    
    updateFlag(fromCurrency);
    updateFlag(toCurrency);
    getExchangeRate();
});

getBtn.addEventListener("click", (e) => {
    e.preventDefault();
    getExchangeRate();
});

window.addEventListener("load", () => {
    getExchangeRate();
});
