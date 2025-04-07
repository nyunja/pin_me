import { Head, useForm } from '@inertiajs/react'

export default function Login() {
    const { data, setData, post, processing, errors } = useForm({
        user: {
            email: '',
            password: '',
            remember_me: false
        }
    })

    const handleSubmit = (e) => {
        e.preventDefault()
        post('/users/sign_in', {
            onSuccess: () => {
                window.location.href = "/"
            },
            onError: (errors) => {
                // Handle errors here
                console.error(errors)
            }
        })
    }

    return (
        <form onSubmit={handleSubmit}>
            <input
                type="email"
                value={data.user.email}
                onChange={e => setData('user', { ...data.user, email: e.target.value })}
            />
            <input
                type="password"
                value={data.user.password}
                onChange={e => setData('user', { ...data.user, password: e.target.value })}
            />
            <input
                type="checkbox"
                checked={data.user.remember_me}
                onChange={e => setData('user', { ...data.user, remember_me: e.target.checked })}
            />
            <button type="submit" disabled={processing}>
                Log in
            </button>
        </form>
    )
}
