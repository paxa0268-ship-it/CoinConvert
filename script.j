* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #0b0e14;
    color: #f1f5f9;
    padding: 15px;
}

.card {
    width: 100%;
    max-width: 420px;
    background: #151921;
    border: 1px solid #262c3a;
    border-radius: 24px;
    padding: 28px;
    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.6);
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 24px;
}

.logo {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 20px;
    font-weight: 700;
    color: #fff;
}

.logo i {
    color: #00f2fe;
    font-size: 22px;
}

.logo b {
    color: #00f2fe;
    font-size: 12px;
    background: rgba(0, 242, 254, 0.1);
    padding: 2px 8px;
    border-radius: 6px;
    border: 1px solid rgba(0, 242, 254, 0.2);
}

.status-badge {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 12px;
    color: #22c55e;
    background: rgba(34, 197, 94, 0.1);
    padding: 4px 10px;
    border-radius: 20px;
    font-weight: 500;
}

.status-badge .dot {
    width: 6px;
    height: 6px;
    background: #22c55e;
    border-radius: 50%;
    box-shadow: 0 0 8px #22c55e;
}

.input-group {
    margin-bottom: 20px;
}

.input-group label {
    font-size: 13px;
    color: #94a3b8;
    margin-bottom: 8px;
    display: block;
    font-weight: 500;
}

.input-wrapper input {
    width: 100%;
    height: 54px;
    background: #1c222e;
    border: 1px solid #2e3646;
    border-radius: 14px;
    padding: 0 16px;
    color: #fff;
    font-size: 20px;
    font-weight: 600;
    outline: none;
    transition: 0.2s;
}

.input-wrapper input:focus {
    border-color: #00f2fe;
    box-shadow: 0 0 0 3px rgba(0, 242, 254, 0.15);
}

.converter-row {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
    position: relative;
}

.select-card {
    flex: 1;
    background: #1c222e;
    border: 1px solid #2e3646;
    border-radius: 14px;
    padding: 10px 12px;
}

.select-card .label {
    font-size: 11px;
    color: #64748b;
    display: block;
    margin-bottom: 4px;
    text-transform: uppercase;
    font-weight: 600;
}

.select-body {
    display: flex;
    align-items: center;
    gap: 8px;
}

.select-body img {
    width: 24px;
    height: 18px;
    object-fit: cover;
    border-radius: 3px;
}

.select-body select {
    width: 100%;
    background: transparent;
    border: none;
    color: #fff;
    font-size: 15px;
    font-weight: 600;
    outline: none;
    cursor: pointer;
}

.select-body select option {
    background: #1c222e;
    color: #fff;
}

.swap-btn {
    width: 42px;
    height: 42px;
    border-radius: 50%;
    background: #2e3646;
    border: 2px solid #151921;
    color: #00f2fe;
    font-size: 14px;
    cursor: pointer;
    transition: 0.3s;
    flex-shrink: 0;
}

.swap-btn:hover {
    background: #00f2fe;
    color: #0b0e14;
    transform: rotate(180deg);
}

.result-box {
    background: linear-gradient(135deg, rgba(0, 242, 254, 0.05), rgba(79, 172, 254, 0.05));
    border: 1px solid rgba(0, 242, 254, 0.15);
    border-radius: 16px;
    padding: 16px;
    text-align: center;
    margin-bottom: 20px;
}

.result-label {
    font-size: 12px;
    color: #94a3b8;
}

.result-amount {
    font-size: 26px;
    font-weight: 700;
    color: #00f2fe;
    margin: 4px 0;
    word-break: break-all;
}

.rate-info {
    font-size: 12px;
    color: #64748b;
}

.convert-btn {
    width: 100%;
    height: 52px;
    background: linear-gradient(90deg, #00f2fe, #4facfe);
    border: none;
    border-radius: 14px;
    color: #0b0e14;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.2s;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

.convert-btn:hover {
    opacity: 0.9;
    transform: translateY(-1px);
}

.footer-info {
    font-size: 11px;
    color: #475569;
    text-align: center;
    margin-top: 16px;
}
