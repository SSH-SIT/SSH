import Head from 'next/head'

import { StoreProvider } from 'easy-peasy'
import store from '../store'

import { CssBaseline } from '@material-ui/core'
import { ThemeProvider } from '@material-ui/core/styles'
import { Theme } from '../styles/theme'
import '../styles/styles.css'

function MyApp({ Component, pageProps }) {
  return (
    <ThemeProvider theme={Theme}>
      <StoreProvider store={store}>
        <CssBaseline>
          <Head>
            <title>SSH Admin Store</title>
            <meta name="viewport" content="initial-scale=1.0, width=device-width" />
            <link rel="preconnect" href="https://fonts.gstatic.com" />
            <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,500;1,300;1,500&display=swap" rel="stylesheet" />
          </Head>
          <Component {...pageProps} />
        </CssBaseline>
      </StoreProvider>
    </ThemeProvider>
  )
}

export default MyApp
