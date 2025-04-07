import { Link, usePage } from '@inertiajs/react';

export default function Layout({ children }) {
    const { auth } = usePage().props;

    return (
        <div>
            <nav className="bg-white shadow">
                <div className="max-w-7xl mx-auto px-4">
                    <div className="flex justify-between h-16">
                        <div className="flex">
                            <Link href="/" className="flex items-center">
                                PinMe
                            </Link>
                        </div>
                        <div className="flex items-center">
                            {auth?.user ? (
                                <Link 
                                    href="/users/sign_out"
                                    method="delete"
                                    as="button"
                                    className="text-gray-700 hover:text-gray-900"
                                >
                                    Sign Out
                                </Link>

                            ) : (
                                <>
                                    <Link href="/users/sign_in" className="text-gray-700 hover:text-gray-900 mx-4">
                                        Sign In
                                    </Link>
                                    <Link href="/users/sign_up" className="text-gray-700 hover:text-gray-900">
                                        Sign Up
                                    </Link>
                                </>
                                
                            )}
                        </div>
                    </div>
                </div>
            </nav>
            <main>
                {children}
            </main>
        </div>
    );
}