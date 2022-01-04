import React from 'react'
import { SignInButton } from './components/SignInButton/SignInButton'
import { SignOutButton } from './components/SignOutButton/SignOutButton'
import { DisplayNameLabel } from './components/DisplayNameLabel/DisplayNameLabel'
import './App.css'
import {
    AuthenticatedTemplate,
    UnauthenticatedTemplate,
} from '@azure/msal-react'

function App() {
    const getInfo = () => {
        alert('Getting info.')
    }

    return (
        <div className="container">
            <header>
                <h1>This is a test for the on-behalf-of creadential flow.</h1>
                <AuthenticatedTemplate>
                    <DisplayNameLabel></DisplayNameLabel>
                    <SignOutButton></SignOutButton>
                </AuthenticatedTemplate>
                <UnauthenticatedTemplate>
                    <SignInButton></SignInButton>
                </UnauthenticatedTemplate>
            </header>
            <div className="content">
                <input
                    className="btn btn-primary"
                    type="button"
                    value="Get my info from MS Graph"
                    onClick={getInfo}
                />
            </div>
        </div>
    )
}

export default App
