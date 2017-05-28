const CONFIG = {
    baseURI: process.env.FLOOD_BASE_URI || '/',
    dbCleanInterval: 1000 * 60 * 60,
    dbPath: '/config/db/',
    floodServerHost: '0.0.0.0',
    floodServerPort: 3000,
    maxHistoryStates: 30,
    pollInterval: 1000 * 5,
    secret: process.env.FLOOD_SECRET || 'LALALALALALALALALALALALA',
    scgi: {
        host: '127.0.0.1',
        port: 5000,
        socket: false,
        socketPath: '/tmp/rtorrent.sock'
    },
    ssl: process.env.FLOOD_ENABLE_SSL == 'true',
    sslKey: '/config/privkey.pem',
    sslCert: '/config/cert.pem'
};

module.exports = CONFIG;
