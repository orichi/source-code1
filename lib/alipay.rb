class Alipay < ActiveRecord::Base
  ACCOUNT = "2088002001035904"
  KEY = "hlzojgajxtq3q2d2vz9tj3h5u8wiu6r3"
  SERVICE_URL = "https://www.alipay.com/cooperate/gateway.do"
  PAY_EMAIL = "yinyue2003cn@hotmail.com"

  def self.pay_to
    params_hash = {}
    params_hash["service"] = "create_direct_pay_by_user"
    params_hash["partner"] = Alipay::ACCOUNT.to_s
    params_hash["_input_charset"] = 'utf-8'
    params_hash["seller_email"] = Alipay::PAY_EMAIL
    params_hash["payment_type"] =  "1"
    params_hash["logistics_payment"] =  "BUYER_PAY"
    params_hash["logistics_type"] =  "EXPRESS"

    yield params_hash
    
    params_hash["sign"] = Digest::MD5.hexdigest(Utilities.make_url_params(params_hash)+Alipay::KEY)
    params_hash["sign_type"] = "MD5"

    url_params = Utilities.make_url_params(params_hash)
    Alipay::SERVICE_URL + "?" + url_params
  end
  def self.pay_back
    fullpath = request.fullpath
    useurl = fullpath.to_s.split("?").last.split("&sign").fisrt
    params_hash["sign"] = Digest::MD5.hexdigest(useurl+Alipay::KEY+params[:sign_type]+"utf-8")

    return true if (params_hash == params[:sign] if params[:sign_type].to_s == "MD5")
  end

end