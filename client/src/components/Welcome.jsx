import { AiFillPlayCircle } from "react-icons/ai";
import { SiEthereum } from "react-icons/si";
import { BsInfoCircle } from "react-icons/bs";

import { Loader } from './';

const Welcome = () => {
    return (
        <div className="flex w-full justify-center items-center">
            <div className="flex md:flex-row flex-col iitems-start justify-between md:p-20 py-12 px-4">
                <div className="flex flex-1 justify-start flex-col md:mr-10 ">
                    <h1 className="text-2xl sm:text-5xl text-white text-gradient py-1">
                        TICJK FINANCE < br /> #1 team in WWC-Blockchain
                    </h1>
                    <p className="text-left mt-5 text-white font-light md:w-9/12 w-11/12 text-base ">
                        A Systematic Investment Plan (SIP) that makes decentralized finance easy... <br />
                        because life's complicated enough
                    </p>
                </div>
            </div>
        </div>
    );
}

export default Welcome;