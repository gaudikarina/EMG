# A Threshold-Based Approach for Muscle Contraction Detection From Surface EMG Signals

Surface electromyographic (SEMG) signals are commonly used as control signals in prosthetic and orthotic devices. Supercial electrodes are placed on the skin of the subject to acquire its muscular activity through
this signal. The muscle contraction episode is then in charge of activating and deactivating these devices. Nevertheless, there is no \gold standard" to detect muscle contraction, leading to delayed responses and false
and missed detections. This fact motivated us to propose a new approach that compares a smoothed version of the SEMG signal with a xed threshold, in order to detect muscle contraction episodes. After preprocessing
the SEMG signal, the smoothed version is obtained using a moving average lter, where three dierent window lengths have been evaluated. The detector was tuned by maximizing sensitivity and specicity and evaluated
using SEMG signals obtained from the anterior tibial and gastrocnemius muscles, taken during the walking of five subjects. Our best detector shows values of sensitivity of 87.91%, specicity of 87.15%, and detection delay
of 23.75 ms. Future work is directed to the inclusion of a temporal threshold (a double-threshold approach) to minimize false detections and reduce detection delays.

This paper has been published in the following link: https://www.spiedigitallibrary.org/conference-proceedings-of-spie/8922/89220C/A-threshold-based-approach-for-muscle-contraction-detection-from-surface/10.1117/12.2035673.short#_=_
