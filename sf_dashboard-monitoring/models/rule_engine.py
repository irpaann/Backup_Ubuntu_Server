# models/rule_engine.py
import re

def check_rule_based(payload):
    """
    Fungsi untuk mengecek serangan berdasarkan aturan regex.
    Mengembalikan nama serangan jika terdeteksi, atau None jika aman.
    """
    rules = [
        {'name': 'SQL Injection', 'regex': r'or\s+1=1|union\s+select|select\s+.*?\s+from'},
        {'name': 'XSS', 'regex': r'<script.*?>|alert\(.*?\)|onerror='},
        {'name': 'Path Traversal', 'regex': r'\.\.\/|\/etc\/passwd'}
    ]

    for rule in rules:
        if re.search(rule['regex'], payload, re.IGNORECASE):
            return rule['name']
    
    return None