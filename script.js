// Dunyo va O'zbekistondagi eng mashhur valyutalar ro'yxati va bayroqlari
const currencyList = {
    "USD": { country: "US", name: "AQSh Dollari" },
    "UZS": { country: "UZ", name: "O'zbekiston So'mi" },
    "EUR": { country: "FR", name: "Yevro" },
    "RUB": { country: "RU", name: "Rossiya Rubli" },
    "CNY": { country: "CN", name: "Xitoy Yuani" },
    "TRY": { country: "TR", name: "Turkiya Lirasi" },
    "GBP": { country: "GB", name: "Angliya Funt Sterlingi" },
    "KZT": { country: "KZ", name: "Qozog'iston Tengesi" },
    "AED": { country: "AE", name: "BAA Dirhami" },
    "KRW": { country: "KR", name: "Janubiy Koreya Voni" },
    "JPY": { country: "JP", name: "Yaponiya Yenasi" },
    "CHF": { country: "CH", name: "Shveytsariya Franki" },
    "CAD": { country: "CA", name: "Kanada Dollari" }
};

const fromSelect = document.getElementById("from-currency");
const toSelect = document.getElementById("to-currency");
const amountInput = document.getElementById("amount");
const resultAmount = document.getElementById("result-amount");
const rateInfo = document.getElementById("rate-info");
const fromFlag = document.getElementById("from-flag");
const toFlag = document.getElementById("to-flag");
const swapBtn = document.getElementById("swap-btn");
const convertBtn = document.getElementById("convert-btn");
const updateTime = document.getElementById("update-time");

// Select tanlovlarini to'ldirish
Object.keys(currencyList).forEach(code => {
    let opt1 = new Option(`${code} - ${currencyList[code].name}`, code);
    let opt2 = new Option(`${code} - ${currencyList[code].name}`, code);
    
    if (code === "USD") opt1.selected = true;
    if (code === "UZS") opt2.selected = true;
    
    fromSelect.add(opt1);
    toSelect.add(opt2);
});

function updateFlags() {
    let fromCode = currencyList[fromSelect.value].country.toLowerCase();
    let toCode = currencyList[toSelect.value].country.toLowerCase();
    fromFlag.src = `https://flagcdn.com/w40/${fromCode}.png`;
    toFlag.src = `https://flagcdn.com/w40/${toCode}.png`;
}

async function fetchRates() {
    let amount = parseFloat(amountInput.value);
    if (isNaN(amount) || amount <= 0) {
        amount = 1;
        amountInput.value = 1;
    }

    resultAmount.innerText = "Yuklanmoqda...";

    try {
        let response = await fetch(`https://open.er-api.com/v6/latest/${fromSelect.value}`);
        let data = await response.json();
        
        let rate = data.rates[toSelect.value];
        let total = (amount * rate).toLocaleString('en-US', { maximumFractionDigits: 2 });

        resultAmount.innerText = `${total} ${toSelect.value}`;
        rateInfo.innerText = `1 ${fromSelect.value} = ${rate.toLocaleString()} ${toSelect.value}`;
        
        let now = new Date();
        updateTime.innerText = `Oxirgi yangilanish: ${now.toLocaleTimeString()}`;
    } catch (e) {
        resultAmount.innerText = "Xatlik yuz berdi";
        rateInfo.innerText = "Internet aloqasini tekshiring";
    }
}

// Eventlar
fromSelect.addEventListener("change", () => { updateFlags(); fetchRates(); });
toSelect.addEventListener("change", () => { updateFlags(); fetchRates(); });
convertBtn.addEventListener("click", fetchRates);

swapBtn.addEventListener("click", () => {
    let temp = fromSelect.value;
    fromSelect.value = toSelect.value;
    toSelect.value = temp;
    updateFlags();
    fetchRates();
});

// Boshlang'ich ishga tushirish
updateFlags();
fetchRates();
