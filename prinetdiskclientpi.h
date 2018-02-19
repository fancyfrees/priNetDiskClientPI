#ifndef PRINETDISKCLIENTPI_H
#define PRINETDISKCLIENTPI_H

#include <functional>
#include <string>
#include <vector>
#include <map>

class priNetDiskClientPI
{
public:
	priNetDiskClientPI(const std::string &);
	void startServer();			// listen on the localPort
	void startClient(const std::string &, const unsigned short &);			// connect  the server
	std::string OclientIP;
	unsigned short OclientPort;
	unsigned short localPort;


private:
	const std::string myName;
	std::map<std::string, std::function<void (const std::string&)>> dealMsgFunc;
	bool serverSignal;			//服务器断开信号，本地进入监听状态
	void onMsgDeal(const std::string & , const std::string &);
//	void transFile(std::string &);
	void initClient();
	void onSetOclientAddr(const std::string &);
};

#endif // PRINETDISKCLIENTPI_H
